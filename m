Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413F36D9FE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789835; cv=none; b=ETeQ2p//w5dQitYt9GpLN2z5EGESd9KMa87Nmq/7IS47y3psDUbXRNz8g3DFQH5adhARsHRIyLy1cY6MP1vXqoyf6skaOZsMm00M53K7kuZTtkkbVCGMZn81Mu3/Z4OX1ncqXZWX2Rua5lu4SNGq8Sj2HnIjn1CCa5zLgCn6Fco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789835; c=relaxed/simple;
	bh=Y5l4gNnj5IFnWaA//fHQGkfX55rsZQiy8kt/OiiN394=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2IBkkmfN8UAh0x7QOUzPIsNbMJ6kHK8WxhXi/vbenv7SHz5DEKkzXo/chAkFsba4KFQ3gg53tG67YugbipATolDXPA61AsPGLoXWGeyKSE05tD5L7tKhph9dPYvYiCR5AlTmsgnDpiSo9MDu0PxaePR+ApVbSDyNlDvble0rR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6WVHPwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4BEhK+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6WVHPwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4BEhK+0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55or9751193
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=; b=n6WVHPwyA+ZLy1AI
	j+WbIzgwiQiCbyL2UaZBXY9hzp2of0UD2n5l3k/mh0UJcGlI4B8OQl7FCiv8VflX
	D3eSCPSmuo+3jpv0YmOjvxS1MDPLpaSM74J/6+I7Xq+vcXIYOunIHtD/eA/tP63e
	2jbGJnS9V/WpxS53pm0j4sweBpGvjCpxFMfvfCw8JUn3/Ns/YbPjhfitTVr0FprV
	eUABaXbNNdGLbrSey0LW1JHBnxZAMYceFaO5ebSMgNORG/BtWdFRpIrkGewTVraJ
	iDKWga0dU2cSvwXZ7e/OYvmqVM9jA/4LDNOzkDI4NCw6h9d0CnU/b682Zf1zMO5P
	zoTNcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed7pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2786131eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789833; x=1792394633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=h4BEhK+0xE4+oUV83mVCaTA+JDUoYelGvyEelukVAQunozdEkXdNmbnwMxqNoKuGYK
         +weMUEmcfX0WOowV8iE3+EEhOTOgaSM1LAFp7A3b1I4F/thsTcEQj3nxCwXwW0xnZt75
         e9LIWtlhEDWDoH907Fn5NqqfMQ5lRUm6stmNO1+WqH+uWK/1EQhuCTIG8QqOMU0GNW8r
         LxMxgMmy+ZiqEFuj8HtvSLzVw+MOKXaQDaH71MQ7NxkBJw3uDm1nSdduQNV3LcCMzjqG
         Nq0vOeBtvVgN7zPpRbIDHTjckWKxj1d0jA4Qn/S3PPoymUfmsAJ8aj4G9IHKzqOTTbwf
         UaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789833; x=1792394633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=np220fKFnGfTjR16s78M/OKAd7ScrjGE9fjGb4iBf2RPLqZ0Znh0UC4/6QBtLbWLFN
         tdvEvxTVBLcA36gKthsIumCvXiCZInxjwWc/4oR9Eel8mgFeTV0AteeUJOfm/akXo5NS
         d1YSWtlLfTo7isqFm72Gbx5+gwmzjTzcy5pG1AEfjqAq0FLY5f/0Md8yKOoCPrkPPPGO
         3jvng9T0cGZYwpUtkHo/fNaFhEZxj9/tP8QD9+ng137tYaG/uOrHFZKPT3PTws7IHkfe
         EIr3c/mGt6qrvCIC4sQ7WuYtyKuwi2eb5FGO9GU2pxtutCxaCYX40fYaTd6y6SkdMDHK
         sg/g==
X-Forwarded-Encrypted: i=1; AKwUvByOKHCoaN4JjWvehmbxtTYyD06flbnFgJw3CZLMZREKNr377wu0zyUU4+Ib7ImOaIRiIQpJq5vEUeTp@vger.kernel.org
X-Gm-Message-State: AFq9FYKONUbxcxLLQyu9guv3+kMDFd5Qc9mVY24F70kqs9S3jNBf7mEs
	qeFPJ0+CWi/2U6wGgu5jTvSVD8nqKl2OsyCcaJpJskKgWB00pzrdN9+o730INODMumg3ikMr2W6
	hhs6ZgqRToYdYe0X1+yoQtm2FBJBxYgvy8BV2hFIGV69yJyFbLJ1NIPKoJZwLfZAZ
X-Gm-Gg: AYBFou2773PL57El0KBu6jDhqAhgQnkZyTt7IysIhrO2uGF7CjcZ1nvuKBbkPiySJ3p
	umPjWyoJuCnsKxhcXv7hc3uKasDBz5NAZwzoOglkYq1BLu0t4ZrmDoMPYNCSEJgj2fUnRUwR+Uk
	+Ey1tGECJp5I5gXAvuuEpa11N22pOOJR77H2PWxoyLJMW6juHFHYwvce+oMfDzq39LsOHQQIrAF
	5RElMcx49TCf4+wS311x8/vuxFM1BuGwuoWKb9pw9IqFt8ozV8q3NgZ5KdZUQTC5jaYAMQVhp0a
	j8ja1FqdXVo4E/bAJjqHeoGwGIKjIIUCSTxQcQ5WaYfCD3E+wyA9RpQFnF1pH5+CMBLWb3FwHfJ
	d46zig9q8/tf+0ByL+zDez+k6+ltJ9PVg6D6IuwHR97Wa9wiDrVsNv7gPgqXKl7d4/MZHZ3JdDy
	XanjxjwF9mKlfadRlQtNHeBY9R9ebH
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034640c88.23.1791789833405;
        Mon, 12 Oct 2026 00:23:53 -0700 (PDT)
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034611c88.23.1791789832813;
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:11 +0530
Subject: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXzKiVr2AoLXOH
 eSro7fapyUsiARl5nKVnGPRcTVNKN0TqkTkXKNjoUescJfU/cT4+WQAcavBMuOYpCSv60xvwyiY
 OhG1ZwHMYLSRv8dRrvNVmzGZ9dGcXv7HyONlKmUaWTAs6yfhH8JXZkti0A1kvhp6wwkkDnfvM0p
 9wYm/00SRthzoLl1KfCM2RsCqar6IFcuPVBG6aPhR+k9dg9og9y0iE66J+iTNV23pEGPP3++I9b
 WzsANw1fLSCRNK+JC7QKzIQeXY72jDuKPfYn5waPfZ1pZXHWGHZ2lODoesD8XOvyxut1pTK393M
 h1fpPe4yAJH5MPN+tNPzaX3DzRUGnEFHeyc//R4XnU6xuwgutIdSKR7nANj6FbduBGbrxuZABDP
 U0fT3Y/S8A4Av/SPW4rF41wt4dYxG2pe1DOD1HDv4T7RjsJ/+GvVD3SljPdrYF4p2x5Tk1Gslwv
 OC+z0AdYmFoiAxEpyxw==
X-Proofpoint-ORIG-GUID: ZOTzHncYNFR1z73b8vWlQKI_Ht8e6VXS
X-Proofpoint-GUID: ZOTzHncYNFR1z73b8vWlQKI_Ht8e6VXS
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8b0a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fxknKD5f1rE6hJysUL8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX9qSYeHpTb2rO
 Z3z3J0n6qJmwQvDakmMxvR6WSbjXqXWmlDkpvEYGEC25YywAYccBWRonZmWFZa0G0O/ckY1XG81
 y/2IJj+AKwYWjqGuZMELBuBNVsuxhlA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index cf1c9898ddb8..7bd0c4476076 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -362,6 +362,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

