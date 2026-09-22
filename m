Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5940BCB8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118393; cv=none; b=tnuaxYvQ0Uzo2leH6Z2LnIOjjKH4AnXABSgEvVd6OC90H/ILwDHvnRySqjjvvSPio3KQKTpPn721XwTYzf6FGIsc6+iwx+btM3Bv7yIKz1wPkn/864HSq3qdyn7fsvfYk017fodKwBcAyMeOxMcv6Z+gev7U5IrYBAJZW5bRvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118393; c=relaxed/simple;
	bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QGnu2+sXOU9osM7P+J0+1TfUk47yfFARdHY3tf+zFgw60iImUDaL5rd3pbhj9oJeLpMCqMaaaYJdABjUtNq/IURCuhih6D6hZkVvw73P1W5qYBP7XavGTvjEdKQ19tnFw+tu5/LbuzQW+F0nOc6ktsDDJeWBrGdKuXqr/62aftA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWokzUl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLyS25uD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWokzUl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLyS25uD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7xRj767737
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OMMlMgnS6xl+6RSHGuHaRN
	5YIWe/23hApHhJq6B6Z5k=; b=MWokzUl8Cdp9pZ1yRBl7Xu4kDMEk1TfDy2fwCE
	qVbXkCVHFIKAhByW3OhMV1t955k9Z0ZUTX9M+grOjBvOIT74GojVlLx+fYnjAxQn
	xdOcKA7JAksDO+288mqDTZ3IavslqZ73QT4FkJGZpOQlchqNWjvoyw6TV/hO6oo/
	Xpi3OZvsU4Jx4qEunh3JJtzGincg3z2Jm4pSvXONCBc/snQezE7+QjPRjqryAQ0o
	rSgBT8umppABZxfdUA/mIWeJ04rE8n09IrNMYQqU18xyXIX666OCjtlKzorv11S1
	tIz2DKk52CxD7OlxYoGJVeqaFvkp8Eym08q5faGyOMhMy7DA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqm210-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:06:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1437272611eso473582c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118389; x=1790723189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=JLyS25uDupF1TduXqjRKaZrAXQ70MggZz2gnEH9SSJp0hn5AO/KmGe35qHZO8zNsnG
         H5QvWjnB6FWwKBdW4CEY+g6Hk6Q9zQTNTG7oxPu7N2TEF4M0g1g9Rxp7ky3gGyGZgFJd
         Dfj1KnHfqWTjhPXD12inoK/9O6rXisuSoluuCaIPoJIiQxxhGndcih1gY3eyLYGVXQrn
         BwICIEguoWmy3pSaj7KF381Yzj1RUcvLqqwPEO9qFq48stjiYAKsChzypb8abjg2DSc9
         m7Imeb1ENff+XMHDzQ9sEN/9ZFAHFN352zWJXohF+rwULdlJBS+QkRnp6Cc3KG9qGUNH
         4Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118389; x=1790723189;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=rEnXa9txXS3wW6vPUkOGKro/7LNbQiNz4YmLAJAyQAZZLG2bOmPzQqozzcRoYirOLt
         eYACKnbIuxWA8k/n5bvICn7slTQzSFCg2vwWhNu8VjsJIRslloZuFsOEmi4xrgYlhYOn
         0XF/yjadNo5NRBN03p/Q2or800P94jq00z88CYpItQUnJ0VYH/2KF16mvIGN3+P0vddy
         DepWm6lyv80iyFQwE+M/8lRpyI1ZWjcy5l4A24KSBWt6lk199n4iGsspnzh5eJ3I6CWn
         d9X7sdHCC3BQ5JhNl5JTExKsLBa9EuuivBVCkiCAXoo0qqjJNhLs9Q74r6XlfLd1ZifG
         1A+w==
X-Forwarded-Encrypted: i=1; AKwUvByRxc4ObYcfbKPRo+UqkQ5Vo+kr75TRKM6/pVQMKLlhYQknzUV4hgB9G2+uyAzw/bm6SgccojBM02TV@vger.kernel.org
X-Gm-Message-State: AFuF++lq/i2C/BM3zZYJkt/XwEICGC3e9t8F0wOMIteL0yIxgRf3r7y0
	sM5VtC42CdfniN2nxIyZyT/V6QC/NZk07TpakYTGT3kFnLWteo68/Lvgr59LL4GznF/rojUBKdu
	nYdWPV6HzsNsb42Ane1DN7TLsCxiNgft71LVpAtmUf4wPfypcRsw9yI4KbC2InDIdpg8Pza2vbJ
	E=
X-Gm-Gg: AYBFou3BXS7SXzwJEwzb7vKCEDyGtu+bBjRML6cQ69D+n7kNdz9UUizG/1vrWckAueT
	ZU7MKXmXzZLVCwiUKzv854gBXih/BX7MjkxKGVmjkSnenXAvrc6lRSgDN4Rn6IwXixhrpQu8lp5
	NjZGA/uhQyyXI43SFb+SXTL7aD7/g44dHDqdPwonnpFMJzmHlLo+GgP7XAmLZdkq14jHR5531qf
	hSvRLC9+1DT6oAUiTx38i/rG19BmDbon3vTKh1kjdwwoLWi7JFsdfLQlrgARP52jEpkxC7hV51Z
	p4as7YVZvL8D/NGjv2nGXTqouuC1muUPALSpa8IrH2MEd5sw7WSkogauJJXsjLRjtHkvKkpZx3D
	EpNJuTl2uV69q0jLc3gbLHSemUCZE7lcmvG8BCXfzXNIn2PoOLeqNfYUiRDRZ
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983561c88.1.1790118389195;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983514c88.1.1790118388522;
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm SM8950 socinfo
Date: Tue, 22 Sep 2026 16:06:18 -0700
Message-Id: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoJs2oC/x3MwQrCMAyA4VcZORtoMx3MVxEPaZa5gLbSwBDG3
 t1ux+/w/xu4VlOHe7dB1dXcSm6Ilw5k4fxStKkZKNAQRiL8sL0NvYjluWCQq0x9TD3dGFrzrTr
 b7/w9ns2JXTFVzrIclzDGAfb9D2bUik12AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=557;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
 b=U4nR/uq0WrGtBKVMnjdZyXqBRdKzO6/z99Vrf/0T56CSEKLtkPWWpLpExay1yd4ofY4ZV56MB
 CbhZQDam84FCjCDWsKcLwGOSs8drY/WNQ8mVC1oxCt+DHzaUUJ7CsNz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX/sT0mBilt9HP
 wqcpSJWxojiPQKIS6Bokea5yS5AAdsT9rkfWVMhgv86Wa9lVzwQ+w/NhUlSmFyrsAqZrW/EQqgf
 c6pp/nxSZTwkeRB8Zqdq3MXB4S+b8glRTZTqSYV+qb67FrUYFlC8PJOMR6fFpMYQCqPWq1aB3+q
 qt4PwNTZIr844upNxDfOk2gIJF15N34M7nZqW6CO7gpAJ/t7TM80M3Y2kNSDqDusmQ8EjzO/N5l
 l86k+weuYZKEp6w/+kDuPt8BLY4I2Xp+mfCBci8Kf6kIo466tYCQflGGJamUdmXkSxQnyEUhr3v
 G6VcnccEnFn+UwGwmEcwXjx4IaFFw/pXld/NGBlIPEtDwtDSK8Tl9oaembIKmNtGFhY0Uby6Crs
 x9lxNQ14WThdCWGGQoEUu0AOXPAOt0bce3GfKaozixmHZNOXa8OL31tyWeCs1QVgyWSIsL5WclN
 E9HGfaAAIvNt6Y/4m6w==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab309f7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bZKhxiC5GNGfeMcMCAUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 5dAV9xS2Wnqwpg3qpm5rAiAywIzQ42_z
X-Proofpoint-GUID: 5dAV9xS2Wnqwpg3qpm5rAiAywIzQ42_z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX919mWlurlKbc
 Z5+RK8ROPOZLrabXVb7+2EsD7DKzNFuf6OrB+lpK6nU0ErmR6n3zc3CHFNv+FV9iOD+J7/X6QXO
 ksP93r+wtvP4D7rtaxP1Kq92G2ecWy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add socinfo for Qualcomm SM8950 SoC which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
      soc: qcom: socinfo: Add SM8950 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260922-maili-socinfo-0c4cd31b325a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

