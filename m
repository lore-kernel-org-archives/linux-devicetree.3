Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B7271A71
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781820043; cv=none; b=EbbhooaZsUEwFqSJB/xp7Cip3TJ53kVvex8VgtVzC7A+3LQxad9CLH68JIueCMpXipTIWavSV9XeA9m5QjoA0Pwx4vWb+8gMWiQ6+WsA3Fu0SlDPjCuWEPnRG4WJ83ebStvfnrcixreu7nCy4U58GKP3n2+PDt3ne5SH+q6yAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781820043; c=relaxed/simple;
	bh=wtJ5sds89h9vunDyHdGULTK0X3CA9KCgDtWoMhjzzB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eCpM7uQObZGs9g6BkXlTMPzexui3LxF9o4JGte8OLxouq6pCIfsRxSFpAUVEqKhZocm5RMgLGpAgcD0V+hTqgdJymxof4RbJ+65OnSSWTE4C/vjUMrjB+pKdwBuPSfrEJ7noiMFIQIWGIql6F0gkdnzA1qp1+uuhRRF7AZ+5dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl1UgIja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eh7FRzBX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl1UgIja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eh7FRzBX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsjPx2988611
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2jHq0CHr9j/tqTX87kkQ/2
	iC5qIF9+D+JK9fwz4ysEA=; b=jl1UgIjaKBvj18YaJLBfiCHYUAUrx1kXnoBqo1
	miS5/FxFekIPosUY1OVeWG2NZdJop7+6bXMPYjThY66M6IH63wQ059OSom4FrK2f
	iSEoYY6Fro1jCgwTPfKktrUJXvjrPXfvKo8Mi8sSfSeBOVbobm+Q1VERZeFsxuiS
	GTVEEk9EmKgx4TOkSi0zlIQpoW8FWDdM2WQhtDabFuV+Wz0UUkjfLJkPpqyuEEhZ
	ZBzrekO5kpsT+3GsQOeEsKzpZnhe32hQezCD9d9LDP7iFvO8F4dyJUKYglMk1knP
	UNaZcJExHBUHAp7kBAPUZmtbAqT144kV4ZybuoFP8nU1I15A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20hgnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:00:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bfe262ef0so583324eec.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781820040; x=1782424840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jHq0CHr9j/tqTX87kkQ/2iC5qIF9+D+JK9fwz4ysEA=;
        b=eh7FRzBXxEZj/+fIJllMTF4ExrU5ZMl571qU+BKiIkGOefS4oPq8FSpNzzwR6grKIv
         1H276XTWUSmo8mUskMkPBa8AlIP1aDDllZDMS9OlFTscNIhYHm6aWkperM9+h1FQjG5K
         6t1spve53SYJMUcXr5bKhZl9P+KrtOqWkkRhhyANIJqL1wDKESEi/qeCaxyeupvdokqp
         vN3lsY8KkmSzg/4JnUgbpkykzhU1bqXaNNnoVhr7dmulTU3CLYkXyMm7tf+UH5CyzezC
         gJ6YSNsLANLragPJiqzSQ9N2N76TFa10bh/DBFf67lm9/wsJdE8XiDeFuYFhtEGyuK6A
         Bfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820040; x=1782424840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jHq0CHr9j/tqTX87kkQ/2iC5qIF9+D+JK9fwz4ysEA=;
        b=hGN/AhIchz6ssz+vDHyXnDPmCakby6LUlZ9XPMoYUuoaLRqZ/HnSxznmEP70P2thIa
         JRDMWKl1lmdi+/xnv+LP4SHTNcvpMumFQnhP+keiw4aXugkAGePX7/q04Dtatd2JkajR
         IIxzGz0nZxexODaVQuhrzJwva2iATpsVugITjcu2u+aeHxYR3oWBZ143YMwnNbdTUohj
         Abl5rHRbShJHWpDJXcwalQ2ZBZNunws1cADAVBwjiMKn4YaQ/pjY+ydRDYkT4iupvkF4
         rfUOrq+hLMP2q1KlvVQACPNzHfkpn8iESBOwrxsVn1k/KVrEQvF+gACN2Sc7iNWmNwOy
         M9/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/v3Jh7z410GdVPMW8uhXLVh0ax1Sdyck5ggsuYk3XutJUGeNmiEzjiNJvxISab1A8NTdbtKY5IHYLL@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAfGTg/RFUkD9Z+qCkXZ96TGyYrWOegJUzzoR+fkUPQt9yyU9
	7qUwAPBHmCU6oPQTSsMY60zW0S6UdAL1JmS7/On65sHNZhkDahQzR0EdI+eLzQfFSQ296pY8KDo
	RALHcKQAOdYeViIVoGrz4wW4WPUSq6u3felcBjRQPKSLeuYf5Sf924Ga3jlnZogRq
X-Gm-Gg: AfdE7cl70QMGJzQ8H6zeGMMlCsHk3VEe75rlriIM0u1BiVoI1uVkHZjowfJMGUEYf2f
	0VX+gqMi+hpGLHEDjEFeonMS9kgaswhqzkqLMFTOtZXng3Ht8+a1PivVUwpHNRl6qDqlYY84wQF
	l84zjVfzwhY35hWj14jkGUl22iarPrTYvHkCEcrkbNCOfQfZq/S+nqW6kWVKywkTeJCldfpzbA0
	SKU3WTt49cGF4lcUNQQ57Uu+gQN2BGPvRJPUiWWBElQYGPOYExxjruisiVaOO1DZqa15f6vzVKc
	CGyNe7WoPKb3pOKOvxC2UYszb+pC4lZCkfHJ/1iyPnRlE1u/VEC32x+G75KuwPaES6yw1+MQEG2
	jaBC3d3mlg6E20XKm8rLqk7ZqC1ed22wRf0V8XaFv3/wyAsDg
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr712909eec.9.1781820040049;
        Thu, 18 Jun 2026 15:00:40 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr712888eec.9.1781820039527;
        Thu, 18 Jun 2026 15:00:39 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm628436eec.8.2026.06.18.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:00:39 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Thu, 18 Jun 2026 22:00:31 +0000
Message-Id: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH9qNGoC/23OQQ6CMBAF0KuQri0ZChRw5T2MCxwGqREKLaCGc
 HcLamThpsmf/LzfiVkyiizbexMzNCqrdONCuPMYVnlzIa4Kl5kAISEGyav8rniLingpgyiMMY8
 EIHP91lCpHqt1PL2zHc5Xwn4BPg1D3eBG+l+tUrbX5rn+YAyW63cs3YyNAQcOmAWQgSwTig/aW
 r8b8hvquvbdwxZsFBtAZFtAOKCgNEGJKELAP8A8zy+Nq/WpEQEAAA==
X-Change-ID: 20260506-hawi-pcie-f61435ca420c
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781820038; l=2115;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=wtJ5sds89h9vunDyHdGULTK0X3CA9KCgDtWoMhjzzB4=;
 b=THQMROGvn3zO2lI+WjghsHrIg0PhfJx1T5KYyRt2m+AUXA7gB8pFKhoEM5HItpxlWzOE6du3D
 3rnzBbt1VDoAWECjgxEUL72uYA6PmvrascK1HxGS0yXK5DddzjVLq8H
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX8Cj0XJrNoM88
 50vIwi41T7NAe68vFRbpaIcFO88RBB0x38zybw9uPJCJy+H9a5kB7Ek1qVKvGKpLubFGVUcrB3L
 gXCooRVJzaIVcKovIG8BXaj/alMX/GdnKJqEmZofq69NV68RETA088luLTuE7QQ4y21WHrq7wIk
 97j6YLUL5CujjjTYlxU8p/XUt7p6RC2iogpGj6TwMPfrzbu5N+nVfF+xVI7IQvWGl2SQtmGoLLK
 fT0AhhOkkEV9q+BOkmoEg/2hooG0bR+Wc7ZTaPfFz7Npbp1CPzpV15uxryFIInv66Y8N6uEPN8Q
 IzJAQZbFlfep9yB6tWB1hHphFeULWCrHgLz+op/phRp/giHMi7nDd/oaZN2o1N1iKp/7Efkzs3B
 nyRO1ivpZDMqq1amp7sfMGLo749rXd4IyRJGkPHw1NhcwJbGm3V8HN0iZpizYYrz4A0Fd89h7kw
 ZGI4LazPjXdHbggpiBg==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a346a89 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX7cXAfwwe5l/m
 MIFCEqU0gmODVR5pNC7iCGfSVZbK2Q1kTR3E85V3VGEwXEWG/dNP+FSXBNFutFW4xWJFoZ9M3Q7
 3rSnFoLLX37Bz32RCgBM47XhkGaxsfc=
X-Proofpoint-GUID: mso2v_CCmqBH7DNuqNhCIMIzHljpoFUd
X-Proofpoint-ORIG-GUID: mso2v_CCmqBH7DNuqNhCIMIzHljpoFUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v3:
- Updated binding example to use ephemeral values, removing cross-tree
  dependencies
- Link to v2: https://patch.msgid.link/20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com

Changes in v2:
- Rebased onto a newer linux-next snapshot
- Previously required dependency series are now queued on linux-next
- Added minItems constraint for clocks
- Moved description comments for clock-names, reg-names, and reset-names
  into 'description' entries in the devicetree bindings.
- Removed maxItems constraint for clocks, regs, resets for the fixed
  size 'items' list
- Link to v1: https://patch.msgid.link/20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (2):
      dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      PCI: qcom: Add support for Hawi

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 202 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 203 insertions(+)
---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260506-hawi-pcie-f61435ca420c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>

