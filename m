Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB773DFC80
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767552; cv=none; b=fhbNlgjY7Z30bxx/1QhCkx+aY7b4MKKni7g7uPxjWxt2V8ZdhStr5UGEJmcE7WkK3MTABJbExcz6Yp4SBIVH7KnDPV2/0WzTED8Eu0Bt0zuLAC+NOupZHhR+3adAOXDZQX8hMVr08CWaQLGdiFwZu3LZXsOPOqvkoQzfkaybqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767552; c=relaxed/simple;
	bh=qPRFTDUweQw/Bg+8InHG5MGn1nxVYQBxlpc83Dm2Cfs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X/IsEP0GjMldzeJV6EJpVIMPdIHDCkZ/Y9UZe84JutaAGGUc+2bfoC+H+4okQj1zk4DBg+BCzjc7TqOwyeADAGYZY4B4FuXTxrDUBqJiNZStsNpoTutjADM02zSJX9GeuRRJy4A6pEPbo1ad3OBF6Sj1eAHMGDx4OFKfRDkTKDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVq4c02K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Obyr6l1A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVq4c02K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Obyr6l1A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYqd1717897
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BtIyNwC7xLcnaPOBk5SgDr
	thyH8HcI8jJbORo7uZcKc=; b=bVq4c02KdHmZXwc40ECJ/PINw9I7M9YzeZwFh3
	lb5tNXe9XkcF9+YqfiaT5Duqpqk3gzhqxRapENKLh2Hdr0W82egOKI55PQZkokUN
	iXLlxJK6y2MKJKrsE+/xSd4BegGvIU5PxCYuSzNeK8Uo0npSti6X4vAj2liXzrW8
	dsq30wcYphXaWzWu4Dr7/txK5WFJ4INFFvhIv5Cx4rIo+BvyGRBmFkndrQkWcOJg
	71AOSs6zCneYD9rqmW0YP6pzge8sDqPay8JKZpLd6EmP9oOc9lHukK5yKRu2Kkt8
	THayFlaPmqSU7PBgLqbi/XxeFofDnXu5UBhTVrEKWOmomRHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7ht4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so4394131a91.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778767549; x=1779372349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtIyNwC7xLcnaPOBk5SgDrthyH8HcI8jJbORo7uZcKc=;
        b=Obyr6l1AXAKxDWD4XslUG1mcs8nRYCVju8O5rCnJXtr2F7fb2VEmqEtyCzrJoS+5BR
         aI88woVD61fkLdzQXWasSBYAGP/x9Fjx3894FegZ+13Affhg3krLQ0CkRvCyExhGen/b
         OFoVzJIkrF+7gsds2W8/IK3gZdoZSJhErRI7go6pmxCSEio0w4/u1RWw239PwliJ9AgZ
         JzC2EMcMVxSRyR3SrGAeCi3ScY1/xDbuP7080+THXJgpDkiH7GxGN6hW9RmB1C8Fr/T4
         gxFpWNX8i3FVOwotSt/guVWwJGUhxT72nDLPR924AJ3eWMBpvIT4cLyxVjgkJNOk6BQ8
         Jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767549; x=1779372349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtIyNwC7xLcnaPOBk5SgDrthyH8HcI8jJbORo7uZcKc=;
        b=TN/4jjO6kQOM4piOivKX7FgEIXa0DzcCWqDPycgY+swMaWKKI1QtiL5G50yRIqGI9y
         89uY9ed0k+TFIj8iv4bFr1M3mf5fFsa1Sg8IR2tHM+/BhaR1RPwJfOkXJqgQEh0dIynU
         L0PvPtqvgK2FpMDhfU+8OaYA6kR99fYV8P5S4JC4ppgGgY1SYbVmMifhkN/a7n9lZHx2
         N4chc1wpK9774DlFa/KTcLmW/OW2r9Hofu5pMe7c1T1NpUkohZ80cHKcu3cUpGwcw6vr
         Ijc5IO/ECuG4euxhM9iPIVsTXe1nxaCnQXO/O3V00MFLrwSZBKOEJ8KfWqj8Q2RLNsNc
         Srhg==
X-Forwarded-Encrypted: i=1; AFNElJ/net+GOBCyW1lL8Dxi2lygCYK4cw0uo8hqLSk1yd1BEChgIOZ067Ez1zYppl/aVLCmMy2o1fdD8Rmw@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAXUgQWXg5PAhhEyX9hLY0L9EHhc1fUfOFsEmidiC2DxFzv8Q
	gCIGCcFnIPcaXdAGWSTJC5uz81aLresEzKhKHCG9EdVMdwoG8cArIDFc7jPZkHu9d9Lph6ZEN5S
	SjKa/w22CMJeJHTFPVt+f70O+Hqa5qw0CdZD/mhi7mspZgXyq4i2/08Yp8Q8xnoQ=
X-Gm-Gg: Acq92OFf35cfBQHT/XZsuTgMQ8dyPNt/FitFtfkRv+p+y0jNlWiQe3ZJb+Tk5gCd37R
	kcI0ffTHYr2YOoT9FQSkDBei4VyHJ2jLoeOIpv+kIds0ajbbi1yHzhf5OnvNqDI8xtaXLFlXfhz
	y2V/Z0M13gfcVUkp5wFA40r1/MAwpfuuZumZReFBGo9qu44n4Esd2sywfYJy7EE4+DNgQkXlm2L
	E+s5hZbaIowwbscuC/zxI5pd9ILFka7jgN21BVi1HzSamUJcq/ResNiYMlgc60RELPVa2V9GBfN
	6ukXP2dBJ56kUrrdZTqYtqIdQudP/hZR/Bp5PDMfvmOhLCGLAO2KW6T8BghkswWB4uRJA3v39WN
	WUaeoWrsUk3s/mPDFH0lm/wKvwIFIegr8LqElPORGed5QpxMVIEM=
X-Received: by 2002:a17:90b:2e0d:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3692334308amr3271320a91.3.1778767549121;
        Thu, 14 May 2026 07:05:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0d:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3692334308amr3271290a91.3.1778767548611;
        Thu, 14 May 2026 07:05:48 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36928a8c1fbsm1502813a91.4.2026.05.14.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:05:47 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: qcom,rpmpd: Add support for Shikra
Date: Thu, 14 May 2026 19:35:28 +0530
Message-Id: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKnWBWoC/32NWw6CMBREt0LutyWlPIp+uQ9DSOlDbrQUe5VoC
 Hu3sgB/JjmTzJkVyEa0BKdshWgXJAxTAnHIQI9qulqGJjEILhpeiSNTxvRx9rPpacRbVMzVspX
 lIJySGtJsjtbhe1deusQj0jPEz/6wFL/2j2wpGGfODEq0dVOVLT8HovzxUncdvM9TQLdt2xc4b
 IO9twAAAA==
X-Change-ID: 20260429-add_rpmpd_shikra-f57873b2fa7c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767543; l=849;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=qPRFTDUweQw/Bg+8InHG5MGn1nxVYQBxlpc83Dm2Cfs=;
 b=rg3xr0ohd2vem6pj2pDY+nv1sNQEh/qvsW54j1vfShDLO4HtwLzwGvldsCgQZR4I3WqyzPpfd
 3+fFo9+zIHeCTxJB7FRZXEoJJwZFykABujLnzUpzZYFrIcMUb+DaZCs
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: 9ovsPFmNiV55trJKOE6zcO0fV0YHD40Z
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05d6bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w8gYdMrFLoSuhkYnXDgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 9ovsPFmNiV55trJKOE6zcO0fV0YHD40Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MyBTYWx0ZWRfX744AADKPwzvY
 0E9UcDAD2pssR/hPkzz9XCJD11UmjtIeo0bngxn6TYfP2w4+WVB4VdtWEBmybqVCGyOQqRin+JD
 cKaKY1mFMz0T9vTCQ1weNFycWTlQlvDxGp0+zgzUH5ZrJDcU1NtNJeVloYZgFDXFMDuarZb7bi0
 APLy47z/GiSo/EQK7xGU8K8Fx6Lpsejq0Bxt7uS1k3KlmASE8hla2ZiaB2Rdv8URbr8QkgQf8YF
 4GU2KxloeMjbYJ4qeHlpLI6YCBBt0KEtS34nP2XrJPs0/h5CfmVO2+6bF0dboaAIdmP7E5JMUS+
 k/8YIh+dtpNDbidvVuJGk/nnT2Em+iZUAUc/DjLyTgMmyQVbpTpx6whyr23+tfcIHivNQdB3uz8
 cyxyT41t7/uqav87HQ1ENSx+fbsG69USpW0b4R2kLAOL+HwLIrtQG3NXximTAsnmNSSajQN4QvD
 Bt30S/5+MK4RAd6fntw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140143

Add rpmpd support for shikra Platform including RPM power domains.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Collected Reviewed-by tags.
- reused SM6125 power domains as suggested by Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      soc: qcom: rpmpd: Add Shikra RPM Power Domains

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 drivers/pmdomain/qcom/rpmpd.c                           | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

