Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107875;
	b=zEf52M5podRjnnEs1TdK34gR6HzWJCzHIRZA/KXm7ilBFQlJXu0rOssDRlHBRZQMdKRo
	 M4adl2ZazLFS/tMNh942TFXy3y/rf4blVP1wGjsdnFkSRkwS8XXvIIa6SPtJVIlgnOKrx
	 44DJB02GNfFDCDP/k9CYFfmge3Ndx4jvIVQaWIv/1oWlvWrEQOuN2ilOiSzTS2qtlu4kF
	 O+tsax9af6E/AYc6FT2D44E+3nPNkCjBmFsLVGRiiuZRo7KgCFXBGUMcbnuA1WKUcFJqj
	 uOu+hx/fkiX0jHpa0HAZBqqpyCOkD/UbGBRHps6vFRhAzsiQaV0qqrikDllPJQ46C8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
	b=tF+oPBtT6EfS3I764KOatnGKZJSxsNX1XsxiBu/xVQOcccHvs91/MFmUA4gbYzq/VK+X
	 Eu+iGvXREQf6XC/rfDnZFUZ7SvNzOlmpQwp8D2UgKQ82wDjU49szngq79dFk21ZuZoCvX
	 d76+N8cxEh78qcpkA1FbRldpG43z7yvdWrJ/4FxkF0D/mmH/iBUsCSdW19vVRInOc3PLs
	 23QaOv9ckFfv1HW66uAbaLvlDjaD3zfh7e/tXM4ljLrul7hljJQtNL812yHVf/yju8NiO
	 2pdJ9JUxHRasCeKZeVoVMBTMITES1jRIH0mAoIIKMYcfuHu+pBOmBtsTDkdtjM46/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/z+n7AF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542460A260E
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B542460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/z+n7AF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrpAj4004319
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FtJT6ChM42qLf5cqURCzWY
	5hoKVKmr/U8sU1QWX4Dto=; b=bpNInUF9dvYGSsRD0rnk3iuaSPxO5q+lT6ZDNK
	6LJlOVydMfad4PxIN4iSe8Eed95wabyzMx8c1Ci4qjbjxdlj1fw+TV+AYzoNXyxQ
	l/pwBxbw5YBwIZ58E86lHre6ZCwpvhDzTwrOgsGsCgrLKx/HZd5lmVhhJAXXvi4Q
	xKsfUnfvZ2EKFtZOhW8s3FRl0EYnXpabToigEU7taHZsMDdcmKYTJmW+S3nW0PMd
	ItQFV5TCfy5UK9V8aAqIgs3qvBmy357R6mbv/9gdcjJprY+V7vUJYyOoK4++RxwK
	6FHi6QE7zTvb5XRfSgmveq7WwZJLL41zLVAnlyJLj9HIdiUg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx19v84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a079256596so30133b3a.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107871; x=1795712671; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=d/z+n7AFTRiiD98xcg/kiDx25MUcCZ5eJijxAFiK40rvqMq83bJbpbL0YybJWsNryq
         p8w44yum78LtdKX1hDrSu0E8G+cFe76aNJSsRk1fVBkYmOtypAbLrHnF+olErfsUN0tX
         ZBWjydMWRIFCoAaECNGShNREVJ3eKYjrrP3LUfTcZypSSNwB/F/AtCxJwRIAvAek9sLL
         TU+oc7jSD7fSMQLtNVNJEW9y4LDPwWs1z5Dt7N7ltvRFPHiSbT8yQv3kIWedX+zlXoEy
         AMHkSQ/upV0CJr5jsT0yF4xMYD81mkJErcDBbcfVDt6Ay3gbBzcrZklV6BoCqQ00vypy
         rMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107871; x=1795712671;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=LtEcl7LV072sKRbftJK3arUGfS9Ow0RE3yOgnSupe/O/cSVRdoCPKnhOcUNCCI+n8t
         BAd/jOOrBUSXXesFxSLef0WzhUthh9nX3uIZs0V+tK2EKK03iUa4gi2Sabow3K2FnMSU
         oPTvFCYrcWZ/u2NSmvSeCTLPYQcdvC0v7l2KKgzncaI3DY5DL3yN6dSTIAVMoeLczIAA
         PzQWbLGdN/GS3Gy9EsuAbt3xEoskI/TZqeKgt01XA0iRYD+KpME3V4JL+ULS9mvASLR2
         jHslyWQZjhbkWBiD7vcssGMHl21txyZ/gAq0o+QEmpS+MnLVwEFlxO+cEwe5Cl5+8+92
         Wf9w==
X-Forwarded-Encrypted: i=1; AL+hErHWjQLn0d+u8zepFED7wM1udGsV30lBLCbXP6RB0j2bDVZjuzTnvhhVxLu3YXv4UJPKyAfQ2Hxpxdno@vger.kernel.org
X-Gm-Message-State: APuU4Z/nGyB3CD4SvATV88VmuArH9OkcGPq1TIWNxk+4dI+UtkDfr2g3
	et1yErlGCVhaq+F5oRrJhxoT3WXXAXTD7HwQQYfVnN451+46MT3jMQ2LARmDQ9c9+CU8ll03nMF
	je181rk9ZzwkBa0BCnyliatdx4Ze8MWjttg1rdJR4KiMBgDxT7cDeB1ZGCpkHK+Wo
X-Gm-Gg: AYBFou0VfHlZiKD2jhounWNeYMTzI2oRuhKRNRk/FJzC/bwFy+cJwN0hrArOyLrxdaM
	DnJkvQHYG8lsT7AQmkQlrylOxpjbio/gXFxo9nii0Vl7inx9So8FZI4iRKZN/bIon8hWbhKtfIl
	/HjBiQ7xxz5VvyC+zd+mBsqV5ljyGFvAEeVN9Qj8CaFm9SSj6rYHocf6iamI3jObyhxHGQSuGzj
	fIxwKij0s7gkIYV/+yucSb8YhyU9T3ETSC68qCnvUj3V6CMsqJbQX8sy7lVviIGZIyhX4MiRaGl
	ng4qZ8g0lHlHK4zU1UtQ/p5guLIr+/xMS3DH9AmZvinbCZyZaCx3NbKH37Tdfmnu+PU8Y9Rc3XL
	Q6HoFZHuKt/Ae+polIE91fEEmhqfzvX6hhNF53t3cYvwsi7Loxx5SMCDiSHtHLpluT2W2QxaKJg
	==
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302111b3a.2.1795107871573;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302068b3a.2.1795107871112;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Thu, 19 Nov 2026 22:34:19 +0530
Message-Id: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMs/2oC/32NUQqDMBBEryL73UiysUr75T2KSJqkulCNzaq0i
 Hdv6gH6M/AG5s0G7CN5hmu2QfQrMYUxAZ4ysL0ZOy/IJQaUWColK9FZ2xLadmbb8jJNIc6iLIz
 RZ3T6rhyk5RT9g96H9dYk7onnED/Hyap+7X/fqoQUhdZO4qVCV/k6MOevxTxtGIY8BTT7vn8Bo
 U7+6b0AAAA=
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6aff2c20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: kKSL4kVXrJKQK12fA6Z-2WNjfRCojP37
X-Proofpoint-GUID: kKSL4kVXrJKQK12fA6Z-2WNjfRCojP37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX+jczqhBi3RDn
 SwIA5adT75hEhQYbJT8a9bpWDcnqveVvEhnXywRGs5oDOFAbh2YcO2u+selAxpLONy8k7deDcaL
 pIb0xLCakOe0m9y3/cNQZxshhUG8x8nitx3o3Jo/6r51cUzgtsbD7F53NqvOyWgxxTW6G9HgLKz
 7p58mUz7TDqk3PXU0GTNyvGhnJaz1Gw4aPtJMeMU/ce4eE3e8pxMLOFkJDwib5YuwxSNqT0mV/X
 tsNyDqgxomUjq1gK+uX+7xASL1cucsJuIGLTZhSkJiWpOJsh3Z/lWEQNiWDBiK7RaK1GVs2LNyt
 NJHKvysRLY+T13qNAtxc/pnLhHoDAnnpCbELXIslxKvso+Rfzm4H1DW3NF8QLFVhofGQbEZjqOe
 +NrKHPf6c6K/6yLWMLhmOpOY6qwL8uH0GKyMNENH7qFwstsh4rbbpP389tt6zew+nxAoh5zrloI
 KABbP5/ixQ3lXt2fdrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX5bFuyzGRwzT6
 pqKyyREYI+eMTsqeLclRqXjpQOFE1a/fNn+UiPAvR+piw/Uq2jMZaSWwp/2gW/9zygi0DyWLXib
 JpXqm0as7oWlNG24hvkoFIX/VEWvFog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190067

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

