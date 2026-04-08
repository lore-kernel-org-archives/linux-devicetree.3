Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7E175A96
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657765; cv=none; b=FfVDj9WEO6Ki38KycDY8KSrXlSKcGM0aPS+QVDNWdnsxfLFArenggM9iBgc1i/3Cb+1RyaJHgvO7ZdUOaNmgi3GW7i3TI0jhdThEfbIGmr3s5ftmeUpZsCKvmZNTsTfpDqzrsIZJ5fihtWe5De+9qJCRFDYEhCSAcsCPBTTl0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657765; c=relaxed/simple;
	bh=JlZwRN4ebBb25WsbzX3Gj0X5xuWi7lYUgM15QvqS6po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n4N9FCkDTasyiQryrpyQlWEkxMrjXkAxQBtFqIpPuZqL+0VrzlEN2kMpKYdJoRhp1bpgF96IwpuIjIj1iRy87wmPW9b/AMOG9QZv5dG4l/Ge7pf+zn7xZJ5YITnjhFdR1zhqzh3P3vncWuL7ySxz/YUb5YUrxiHoWxarGdBpLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe+YqDtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOC3TbDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe+YqDtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOC3TbDn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389gUi32411864
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 14:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t911cuUdDri4SVzoHl8Zqz
	Z1J73rmRBKtRxctGQ1nXQ=; b=pe+YqDtAwxNTWZ72L+th/gSdj3grupI7N2KPIW
	FOj5/GeTsD3H02ez8tMqOf4fsf1qZa0ImRvWBoi0DUZUgK8gW4q+WHwE67jz3VSs
	zGep4Hicb6ZBgiBvPxZNJKyan+rQcZ24XJDmNuHjw7F0kxkwEtkBXf962a3TZoi7
	xzGQO+gYuaTKSDgMFAg/Gqm4ku67cYi+cZ48SN+hkXhzJYH2+hWVJ25U5De8ntB5
	6iT+kfQU6tNmyLU6XdoRLOVj4AddrzgyH6+AVakF1wk/SMylKC2Ivt2E6b/JdKdZ
	gmQhODGxebnDmgMFKvZoJ8DJ1JqqJXz3agA3dU7EnVcEXzmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vc4db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 14:16:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso8004536a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775657762; x=1776262562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t911cuUdDri4SVzoHl8ZqzZ1J73rmRBKtRxctGQ1nXQ=;
        b=FOC3TbDnM4cq0qWPEIFjItxFSuCBdgO7KkDefJTjc/k/dsHNH7hC1vfeDRYvaxuMvA
         hPc+Kn3Gcxa16+fxE2HQgZF4e+CZq9pTpdD3dRrI2rJMjwJFPNgOLK5j9FIdgg6pma9P
         7igpqScNUePnkLNhByleoaFLOxj/Mb0CwxO0SZcZYnd4TdKkxYvhGXbGv9LM2ADLXoCH
         FtpwB7tr36M7odfolMos9B6N26oqMbfpnhl3LGa2olj3nLQ6oSBKqnJLOtNiLR19fc5p
         Qp+KWe8viQxhSx+w10ymAjHQsO/Z5Cf93JZ0zy10VAjzT2GMm5NhCkHtKQhNhnn1JDko
         w75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657762; x=1776262562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t911cuUdDri4SVzoHl8ZqzZ1J73rmRBKtRxctGQ1nXQ=;
        b=TB9bdc7dmIkbvVD2DHo1Vk9l13Z4Zbb9vO2lJq0Jc/IJ1mQSR9ex4UCKZiUtVpoMNK
         asKhxW7cdT2TOyUEEHab8AV2d52GVLIXKlH36NH9+JVYgvc/nnTfZIPZs2yDAOgG79Rg
         P32lQkZebboGL1rM94266QIPCmYeeatl/gFx4oc4OCbr9u9hk1PPC7S6wi5jiWCcOqJD
         Ym/gdsIY8fE375Ef8I8tpic8llMWfiVjOjcbcqxxMOwa6HHMOwPZuSZoz3d+hUlFj19O
         +B+4gy3abXNzXFyl1dXdz+334Pp+TUIOmARb7xYiro97yAWH5AT0hXYkViOLcSTA3fum
         6UTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWCLwVvY80J68peWoMfqx+iXgdXL3xX1+c65LvpkunkaODwSexJV17Qyp3XL3yGCIW+QPyNwSVN/33@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWglmjTXJ775V+1yxw1S7XjRcFEHcwH3jmBjft9e9vvEhotd4
	LhY77K/RwH7ED7aHsgIV2Om3TVV11SlZLCpff4Tiyfs/SXISMNxNEZ9k5hDQ60XHk6myTmp8Ps9
	lppVYkLnqzbf2cwr7Iy9ElLxYINBFOT1EAXGv2gNZD1OXTfLzgfvJqvkwqGxVK1oe
X-Gm-Gg: AeBDieuQhiWPsAYUF8dlmSGEElcFgJv4Cac+7c5virU3Gk8ri3hZZMtqNRcjgCix+cr
	gP+9lHYwM/lEfML0Q40kZ5uSICVNxcSucL43COPhjfbU2uQm2NorlrTpVrPlTCNedUxMDzc5p7O
	+nE57sPMdhAnKkiUb1EdVJyCy+gM3buGzzf25s5C94wZBJqpipqDRDb+v/qZVBmX4i5yi7IEQtJ
	5t9tna0gLqLZO/4cyScZnvetH216AgUsy3hDAoBf/EK4yz4CnYMbMBC7rm9yu/WMW10lCld+mr1
	54xzv289fk6wu0DZYt67Pje1lbZDNNeJXPdnOMqXFgjNu5MixtTNj9Xqwe332srRpK19RTZR29p
	0faCh9asK3s2PBKaQa4g8d/rXiLxXFDAd3iOxSWcc54iRVbIQ
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr21677330a91.28.1775657761784;
        Wed, 08 Apr 2026 07:16:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr21677256a91.28.1775657761091;
        Wed, 08 Apr 2026 07:16:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm26261851a91.8.2026.04.08.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:16:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Hawi SoC
Date: Wed, 08 Apr 2026 19:45:46 +0530
Message-Id: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJj1mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwML3YzE8kzdgsy85JKiHN1EU4sUY7PUZKO0ZCMloJaCotS0zAqwcdG
 xtbUA6r0ZgV4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775657757; l=1348;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=JlZwRN4ebBb25WsbzX3Gj0X5xuWi7lYUgM15QvqS6po=;
 b=dCnD0oSPe3AQpbMlp+IjADmNZt5JF/ybR9R8p2vyC2eheYLvVGbSqFCuDhUL4s0zuH8HlEtfr
 IhwiIme1284A/ReVd8JDESU8ThmJffp4hN9TYKMwJ0ExGsjFijepKzS
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMiBTYWx0ZWRfX/7Eb4AyCxEI9
 cBar8gb1gWghMwU7TzXacXuDwhwkTTBnnrFb7OQ/aSSwlLSgfD84E6pl/MJBYaJDsS19iUl0SJj
 d4bw8zTFaqn0jkIOAsKQM31CMZs3QL3VTYubYa2cBJbZ1FNNjGbZFjYp5FdT0C4y3lA8dhG/HGJ
 OjKnmgTtTtQ+ie7GZWNpQ9GF7A7clfC2/gD4zZQwyVzYzQ3z08rsD+gYLi2LUuXYZabeWuBAtlP
 HHWS2OsFfjb0Srz21KJ83eduP/ZEV2QkcS5ixG5JpdSPJMFZqwEVB/CoOINBRqmxNW+b3uvA6Im
 YqoocICInr/oey3AMgIttiloND9hldyIpmnFz+JqBnfZO1H1tUEoTnsSBqyxcm1KbMHs/eLWqXt
 u9cBqwT86wFmRUoOv1QTIbi/OkxyomTxJoRk43fvcadCHzcPcKvk78BHh35jcrWXEUT28iqENXs
 WFFb23pWMNDV5f7wp6g==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d66322 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yo_fNwfm0L6vNVNaIq4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nRqHFPwH7OnbQG2XA_J2v9GnT3K8NwUi
X-Proofpoint-GUID: nRqHFPwH7OnbQG2XA_J2v9GnT3K8NwUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080132

Introduce Top Level Mode Multiplexer dt-binding and driver for upcoming
Qualcomm Hawi SoC.

Changes in v2: https://lore.kernel.org/lkml/20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com/#t
  - Addressed some of comment raised by Bjorn on following
   	o Grouping i2s0_* to just i2s0 and same goes for i2s1_* to i2s1.
	o Group the function such as qup3_se0_l0 and qup3_se0_l1 and qup3_se0_l2
          and qup3_se0_l3 together with qup3_se0_01 and qup3_se0_23 and
	  do the same of the other similar instances.
        o uim0_* to uim and uim1_* to uim1 as they are non-overlapping.
	o Grouping change for nav_gpios and qlink.
	o cci_i2c_sda and cci_i2c_scl to its respective serial engine
	  numbering replacing with cci_i2c0, cci_i2c1 ... etc.,

---
Mukesh Ojha (2):
      dt-bindings: pinctrl: qcom: Describe Hawi TLMM block
      pinctrl: qcom: Add Hawi pinctrl driver

 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-hawi.c                | 1610 ++++++++++++++++++++
 4 files changed, 1741 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-hawi-pinctrl-a58d36ec2fc2

Best regards,
-- 
-Mukesh Ojha

