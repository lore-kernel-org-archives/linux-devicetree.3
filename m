Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3938406270
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366201; cv=none; b=VxwZeltd41DfNa/YrrmDV7hOeBQT7oU7rTyIBfl6S9a/GQLJbasfyOWjCgKq8ykuxiOOgoZcXMPsryOLGNGFa6ZnC0NBWLfKHuaTEd2fzqGOS+aroxmNtVhOCopWtlpd3fFRRGWEBfsUInx4NWBEFw9P7bpJv0Z9GzIndfEjGHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366201; c=relaxed/simple;
	bh=kOIkEPFZtloUYwpSi+XaO89aEWxmjyAfSJyVgmXGN74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwJafSJA7RH1JkPztEG49VCKo/2G5RzfDNCb99fLDaDypJ74QggkeeuScm8QjA+mQZ7k9rt9Omv5mSyF5hgNPbuDhdBk9JslgnAbpxkyF3TVqeh3qBlPObvGdG01XwOZnHua2vPuvsh4756ZguWhnAgA3s4uDr96rRD8tAJ/RoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqdZ06DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSIEdzQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqdZ06DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSIEdzQl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCqanM127497
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=; b=YqdZ06DHR5WcdNnz
	6HP4HiIl1lZeVVXNI3n8eiZEVP6CwGW6v5TqTEeKfR4tWDYHpm617QkxYu23B/6U
	WGeMm3tGVQonOQ1DWNK/FEFwU+4ooMk7vKRDw1L3MYt3Dcv8/w+frklGpJDGyMrb
	qRCsf5XI/CHW4hqYF2X9kWNH+FhOAEZ/jcdGwatUe2Bwb5oldeT6kmmzwnCTBhAl
	D8roGhOC96lEY6i8cb7JBdR32P9wt36/zXGSqcqpsppVvamlldUwUHhAHiJuvmQj
	0UoM6H2juougHmtM6f8um5/TeQCBvNLnjoo1RyX+ftEe6gkhztR8bSXBwUlfA8SL
	53ylLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m0m55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:29:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so72239851cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774366195; x=1774970995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=;
        b=aSIEdzQlN3kB9Ptv6d8fKU7TXnyt9N1yScxNUsYNjg6ZcKkTqonUdQhftwIBA9xPpk
         U3PRWd09TQIbA1238ISCkIAPfE+R2Z4b+4UNn6E63DoUf2C57STEn0e8sS9+AgzznXyp
         UgqyxUm4m/3SZLT7zQ7Sm6NHaj6gB+7LOVt6i3QvO6hnb0Jkb3PCH4DG0avSxQ40rOYP
         88vh5o9g+YaUZ7An9j6XEJl9QtCA/vAZZljWuBoJzXzpMQeeUkI50BA43r1S1z/EHsF8
         wuoV4oUozydl7DGAzC/XaZX4ntapLnJz4ktXf9U/vbZpkNBcCexOmhunu/M5lTRbT0Ws
         2LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366195; x=1774970995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OaF4t5wF8sB8MPDX+QqW+3BaUm7DeWm64V4AiHh+uH0=;
        b=ka5AEEyON6TiZNbZqHS80codIe9vq6OXFOOu4bUxCBkZoq/Lfa0vsHwdT12ikJ1WRG
         1Yg50K6uJSWLK8GCQdj9iqjlDfJC9cW4TMsHGu4eC/fZWpJ96kRoHlEcrQVTqckegDPj
         bmgtIyt8qdTunmUJ2nBMdEV9gWw/8rSxUOStnTcDOIJu4G12OUSdZDZmnVa9ijOEf0v6
         yM/v8QgnEWN4I8JBj3vBd2tMOcaZ71nd19dSaJu6L/VvAiwVp0nV2Ht3CXBWntwgpS5D
         mmcKatBTIJs9BJIoYgiAU30qLPkmJFqrw7wX8T6caw0RqwFsRWVLu4VLOyiVi4lb5WAp
         Cl4g==
X-Forwarded-Encrypted: i=1; AJvYcCVL8uFZLwmRna0KFaDRiwKicMuaCk0ry0+frHl7gH8/7+YWgQvuVf0HKrlIcY4vbskSfbvIC1ENUFmu@vger.kernel.org
X-Gm-Message-State: AOJu0YzY32PxDqLCKm3amTe6MWbMjTrllndDxfrFFVjOq3x9UgHbfc3S
	hHrwxQrPqS2h/UQnim/A5CWjEzFjbFztqGKa2d/Z6po9552W5JqlWtdXI37BryNm0SwwihaH1Q3
	To+brGO2CFUNRMvqpbHUQxRj1IFqIhV1JmhXN6ve8I/AUQ+/6ItB/M7pvew1v+kmEo+Hgl6qi
X-Gm-Gg: ATEYQzyfFEmrl7dT+ZhnWl9jQUDa6YWPgewLv4U/ZUwdr93BAinTOv7NkIaQPItpZ/X
	i7u4qXoKuOaIegqg4Ofs5Zjs/0qqWJav3eiF3grIsxVdKiXrhO3R2vyD/U+hsYLyan3FYSQGGIp
	spCw0/L64Wb/JpI0C4DZIrma/uAF3+OQD5fW1BWMwnSwLwcCUjB3kFPkwGmT31kPpYh1BHH4gxt
	qS05lmD6gWcgji9h/gPFQ1FVPYo9M2MCdE/epR26mawkCxwYawCC74qX5BuFf0EVklgovKQ3N5y
	Ti7DN12Vsc1xXnMrB1hx+7jgJ8VbLU4nxDOIhbTVolivQcpbn5LA0+8UfNjeb/fJ776dZA6hfFA
	uEoONxhdv662nzHNt4bex5QKtf9A=
X-Received: by 2002:a05:622a:4618:b0:50b:2e09:8c6a with SMTP id d75a77b69052e-50b80f2a9f9mr111471cf.72.1774366195121;
        Tue, 24 Mar 2026 08:29:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4618:b0:50b:2e09:8c6a with SMTP id d75a77b69052e-50b80f2a9f9mr111091cf.72.1774366194485;
        Tue, 24 Mar 2026 08:29:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9ce8sm36943385e9.2.2026.03.24.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:29:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:29:42 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-eliza-base-dt-fixes-v3-2-3a4a03e72f8f@oss.qualcomm.com>
References: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
In-Reply-To: <20260324-eliza-base-dt-fixes-v3-0-3a4a03e72f8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kOIkEPFZtloUYwpSi+XaO89aEWxmjyAfSJyVgmXGN74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwq3pw+lsLedvhS2V15+gClRt+ze5oVD3+LT0b
 Hk1K+0THV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKt6QAKCRAbX0TJAJUV
 VqRiD/9g66WDbaBcPz9hj8KolrUZl0VMBNffXZHTXZyMNjd1rcVk1va0+Vku7I6tEryiyGM/Qq3
 pgf/UdAHQBMIB22mNbxl4nNJd09JSd0BQl9C3KhNlvKM0BFIN8vPj+M+iAy5IuDqIjpDNEi+FFb
 bCz/xIkZ8U/fDmoPx2Hvagjj0jF+oC24QasZByStsnVxrgrPRPv0Yfkk3Y0qJmsV89FZ7gGODhz
 45v/dGNXsUS97rdOMqaQ6dbP0VEc9UK6+N9XqARBKxaD/+ogZ5sZQ8hlGQk7CL+pAK9ksXiDVZ6
 GxuYpJCX/vxvDeThpwEfh8jGUupAsP0VZ3ySLfCK9U4jSU9pRqwl3X+4ldIqtMNGnO9nBkd6wHN
 xcBQMDzbnVeK70y8BYSwD0inkDI58O7li0ZYTivxHSihVnxdNjaISMCBxoP7lnPn2Scxv98AN0e
 a26Fpauu5vXN1UBV1XcAVr48RHKxngcRkrp5HgfQACqIy5UJ+8O9FguuHFk7ZSXwfOETHizNYFN
 Gz6Id6R1h4MoQgWfioEu376LuuSixr3LX+tklVEdoWZ+FAUwHU8TKJgoaCYjs/rhUu0e8QLAwNY
 BYp35wlHsWWqgAuCbbUqkw2eEKKJ0ckHuXSSthqjjxSaxi74Qf2WWQuDgkIZdG+uxgtn/secPUv
 /Z5/ccIkjAdSAKA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c2adf5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eWTIzzE_mSYKg3fclygA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: dgSEy6CcOZIIYCxlsaG_EptALBK5Ev2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMCBTYWx0ZWRfX+bXK567PC2MX
 HpzXMO2xTvIbpmuX8yNHj5FJnCiNKTw/eXw344NYo+h4/zgTueBf1L/CKyyp1Mc5nLIGjRbQr6x
 7E5fMBGQDx9Iv3riN0Xrred9TBqkV4WQpsqYZ8m+f5MafIAJJNm+/+t20ZLZgVRBZIctus3Ntwb
 KI5ZlTuT0NSh0mfb7i4SsGgylshALjcHpfA4qzK4obNHiiPuaW8v82zACWiwXccWZGu0qu1gluc
 hJcxmnKQN9O0CV/QdDmmnAOikyPh/fwjeQOVgBTt1CfwXx2Uip+Ksq0ASK6M+QFjW/ExhW0qnNA
 1CRgnHa5x5DGE4uQicVAhL4PrgOEzQc+HOGe89o7sM/AK3o2bs6WCA4xw1THNGa86uhcv0VzOUF
 8rgerDjJGPFpp6AbyGWejmMQbhPX8nTCVlRMovAa6wmcyuXs1RL0VCffyeXOeGkYYgC6g+HJ/M8
 0ovKyqKnOXoUP34ESrg==
X-Proofpoint-GUID: dgSEy6CcOZIIYCxlsaG_EptALBK5Ev2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240120

Unless CX is declared the power-domain of GCC votes (power and
performance) on the GDSCs provided by GCC will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1

