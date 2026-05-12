Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88536A343
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588347; cv=none; b=PoGKct6QgLZHlsm8r+/dqsaX+KYuESd694Hx6MLX+iohZSBgc0SkZZNVGe5eaLE2a6LqzFoHUbl+BUXxXcd7vsfqvBds8z7usuprqWtOcNTRMipAVICM2Xr348RzTU2ubB4CZf8+4pk1oTwOtrCwLSJ1wuhNvOW5KsI+Usx75Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588347; c=relaxed/simple;
	bh=6Sf8vas4PHtUAWVpKu9m1KQiPpgtKGBk/lLZaG0jX9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDoGselg+FZWYrkPbyIHMER7VQg+Bm9+QWOTFly1sGlXFNqElO+n/QKUNIkjB3iQ1LU55GguWUXdYsCt6jhwCbrOZyGxBOPiWgqQxlSo+KlGtLZ1mnxfQDSN37LbiCcY1icxFPMUzPLs2fSTQTRxrO1MZ5OLyi3hKQEJ0NsAyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdkJZqHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQcTUyGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdkJZqHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQcTUyGX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2LaC3444808
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=; b=mdkJZqHOSIZr2sHj
	So1oedgsi7dqV3s6y31cYZBWuJa4NSLDkMA9je5aGnAnvIMHR+j+bdZNCIiN0tYC
	tbhTWmIKCevi+DSvFxUO7cCmvhF2hg298wesrM+EV0ldCUQLhI6AK2+1ZGWt1f9/
	aGctfkbSAxQQC9yng0F8MXUKgBvm9xywA2vAe4p/QDlsA4BJ3FbKh7aR3YWR6ZGY
	nFRdRdYAJ4XuEf2G/z7IPyvrLvQ1kUhknT2bUFaQGciNQFFOMyXow3F3nCI0/Ttk
	RDDgAQ+PmVrY8c5AXh+dcFY+vbWsKDlvy+tes9Wqia6jKv4yzjvv92UTHN6RG2DX
	SHDaAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0k6xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso135734591cf.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588344; x=1779193144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=;
        b=LQcTUyGXPJO6TO7Bd29epAMYlEwJgiRsc0as8lXuRCVvAQdj/3NhdM45t8Qj/c48Vu
         tYuzPuryuG7Eg+wSaqUrnWaGXXs0PgOpvMjS/Dv0v4V17/gDOOrQFzOZsoc8fF3Csbpy
         zGXXVhqN9k7Tv3yOrs1gSt2HAqnBv1QL38wSIGHPRRQ0I6T76C6Y9wh0gfOSBpj8NxyC
         rbkKz4kJ6H1boQw4d5B+cJGDVabVqnly3KSso41pixEDwciggUjiCxb9zaz+P2/4TztT
         VHRNdUeOZ4AUQhOPbizeOsGGfUYi7+wF+fcTbqwWUyHkHgUUa44ihy5vmcDzuD1nfBzR
         HxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588344; x=1779193144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxIxPL825Lb/iu/06hO2kw0SxnGFVq+Qz23EK2d+gVw=;
        b=FLQUBL9Ks6AXhIG14by/yz+4U0SzIjXdjVj9zLVfXZwLxxqg67vboGrd66cb/3Ds3e
         fNnpor/ve5Kk2fcqM80EijE1CSaBlaj1AECyT+2aDk8Zj5RDGZBEtAGtckTL9QpNmtS4
         TddVVTZRpW1n6q1VmIqHRajRfpUU9f+FDjKNP9ivUDd8S+1g+0MdLVJGJY6EP0+KrfdX
         LkfZ7rWmU6wUhUuMXyrvb0zeo1wg2pW0obR1fuIeAJnWkQ3xmM23rXtkh61CUt35BDFz
         yNq+3s9zN3BkhsL0XJ7beJbA+lDtyKmF5R3a3+PC3/4n8nsEqelg8gixupcZxIkuqnvF
         Vu1w==
X-Forwarded-Encrypted: i=1; AFNElJ8IfMTxEqrYJrmo1qQyjtrdWG8dMxWGic6ysBii7O7VdIrLL7AT4LWsDRemzWzYs3rU5hkHF6zik6f2@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWMsyUqbb8OVyejdEJIS3vcLj7dnEtQKYYcoq94/sj3t8iA98
	oOqs5BbXLriqb6dd3dGH+wbwmB6GZ1WqZoNLEcAYA74PdicZiFcfZ1I7FCXrrLPkL0KMegXSB7q
	kqqSf0W8UyiXHMFj8fsVZF6CpU0la9jyN4xPMZTf1ATSc824YLsu+HcEy1HAdhJ5h
X-Gm-Gg: Acq92OGr8rmnyndGatMrn+LnUGe5i6odHtyBTFIUObk7diOgmtMePBamcRHCgnI3r8/
	3UKSsI6zCTL5m+8a1WZXd58NYChLa28Y2jImP3JqMM6sLhxAI2WQXej5JnE2eKSDd90W9LPebMy
	WWm1ICMWEltmGkITvXGK2rA2HDC6HCi04mhhsobrT7qwP25FbIV76ioyzzT4xhTh1+QHdIQwWwX
	tv413jTT6SnjsSUDZ19JUq3ThT14xSDiJDw82/FLnJWRKFffP/Z5QZBZB3Gmym9Plmlx7jOah8x
	6/epdZNCQyHJp/kspzSH1Q+/jp6sE6gdqmJrwGTChW9dH+G9SjFfj/F4C4X/BRa9pvKDiZ+3DZ+
	3U/9t5y9YVJohX/xL+I6hy/zZ1G8+Og==
X-Received: by 2002:a05:622a:1181:b0:514:5c9f:6d9a with SMTP id d75a77b69052e-51461fdc806mr398384181cf.53.1778588344241;
        Tue, 12 May 2026 05:19:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:514:5c9f:6d9a with SMTP id d75a77b69052e-51461fdc806mr398383631cf.53.1778588343702;
        Tue, 12 May 2026 05:19:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm33700213f8f.6.2026.05.12.05.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:19:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:18:52 +0300
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add SDCC1
 slave
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6Sf8vas4PHtUAWVpKu9m1KQiPpgtKGBk/lLZaG0jX9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxqxciVrsREC24LhNZY/CuAOWpX/y4FRkKwGR
 R1yfn4a9S+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMasQAKCRAbX0TJAJUV
 Vo5SD/9TFySVxerE97NdogvRiYi3IHn80SK0Q4xFCTri8qohcB+2VTbpcB32LcKWTwgtOj7uMis
 MkQk0WuHCEWYhJw5GGNJCPPS6sdgKLb4rs88YLX0rQZJFxGTnvcwWhUkrO88Xzv3kE4fjL3vXzm
 BpELa+r8Z9yC7ae6aNBhaoeRXtLG/cgvek5yfKDIJflPs4/OVCxtEeChrkedfb5Tg/pTxhEuGqw
 6Trck7wcBHUqA76Z5439wI0HntZaHmqZM8MRIKBt+CICM6IDaOXfbabCPvNUEEF7wKvbCKu+wxu
 WQTFTjto8VYe/ht7nUBdfIx6/y7BMRTyOTGCxO1IhQIY6zRVGow5Z6YU33DtpM9cZ7O9N44+Tuz
 WdQdDFWGdzXHokoIpqptdFStZPG4Dk5Tnz5oYy8S//S479gMGtO76i6BaJFMLe4YJ4/6toamor6
 wCNqDixd8ynWQu4xtg1igrRVQM/KLxchyU90SfiVi/Ypce4MQKtWIRt/cL2uHd0FWvcRNnCjyzT
 Ehkwg34QcWUenBoEVBMDO934rOXwjibayG1mVr4lQK1CWoqFSKeIIY2OzfCX1WDdwkWcMAJLJZ8
 72BBtHAcFQgEmDQn1wB66VFxNryMPWS1WvjEI8cy1MN3ggQ0xZuHzX6C1q9MGBpeBbL3M2NId6h
 gmf4UNnMnWnlRJg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a031ab9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xi85gMORp529Q7Pi2tIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YKQE9jXFBnKB3jbUgKXU3CWmukgfGUAh
X-Proofpoint-ORIG-GUID: YKQE9jXFBnKB3jbUgKXU3CWmukgfGUAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX3HcwuK+voNrc
 r9wcHnHnIKnL7+ANQymJYKeEr9yRJjmWAHBVKRpXugFC9XdF4DBO74oQnYDZMGErSVD6mtQ1pgL
 anYQd8gmkJg6DfUIpfOTM6Y6Fx3V59CZd8kDCK8/C6Oh6oeWbi54n/j7fgdq+eOl76ZjQRgiNW4
 FBK1HXmKLo6UWL2CeOaE9UiWf0PQV+VvHKqfxhITguOVhIlZzTtid7jZdOCE73/2BHJL7fEAv8K
 zClOMu0L04wwbSk0NPSbVWMjdOTAlCm3PDfSpwO6ppY4ik5VcFH1PN5H9KN5gVyhNSXF2FA2MLu
 XtKR+6X33oDM1kY57ikA/Nn4W7MdgRGc7dCCd5OBqZzM8bZc7ISIvldLVCWyQG8L/BMxlG9Nl6N
 7tWzyb1FJoQSdbU5Q6qRWEymFxk2niLIbvTlGqFkTffgebO6A0UY7QxMTkywDwNV+VwHMKO/3Sv
 wHQ6gzkEJxgnHLnx0ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127

The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
slave ID. Add it so SDCC1 consumer can describe the corresponding
interconnect path.

Append the new ID to preserve the existing ABI values.

Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
index 95db2fe647de..dfe99feefb27 100644
--- a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
+++ b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
@@ -57,6 +57,7 @@
 #define SLAVE_PCIE_ANOC_CFG			27
 #define SLAVE_QDSS_STM				28
 #define SLAVE_TCU				29
+#define SLAVE_SDCC_1				30
 
 #define MASTER_GEM_NOC_CNOC			0
 #define MASTER_GEM_NOC_PCIE_SNOC		1

-- 
2.54.0

