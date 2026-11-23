Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414762;
	b=bAGN8oq3EimbJxu402BbwZ5s9Gh+U8T5ysr2QMs7B9bLzgYc8v5OZ4p26dilJV/q4ubl
	 G6qX7WsHvt0ndoAqN/l1mu4QwVTOozfB48mMjjj4FZdM88yJFAg41koYUytbEwtzNwzRr
	 Z4LtS8kCyzYRnqu05UjkxbdXfiKmjnWxtjuiLvxbz2fHVqzs55YnbE8mE0EUHGxzkmKPm
	 UkY/VXCi9IxofoYKPohxXl1VXCRwprZPob4pgYq9sT3x14LUpz9CAGJnwiNdpEewgRlkY
	 Z5m9G7Pmg1dQWuuUYJcCVOepFyNA3zdk/tcSvvwJngUasr2oDRZFQ/PoCZ0CQ4atZQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
	b=xKU99zOh9gK2FnYApdUlbGXsulaSjH0UcfG+SruFx8lXFZFd1MEiQOp0AVRCY6VaKoKX
	 gu4W7Kb6PscK4dN+Tb4pU85l6qQQjt4eV/KvG9SbVzlzMJNWA58CkAhWr9XtTNvF7jqEi
	 EPfZs0Dh9/k69Ao7S+oOpozxAcl85Aesl13Skca5SfFsvm2ffkAMYjP5L1jCf1TNUeMIH
	 Ho0kzCuCGQNdXJpaWtvC0gD4I58aBIAQnCoeAi+i/1TenzrsegxI9a5O6R9SAGjag5odN
	 RW9NN3AnqnzzDcgTQH3bMTvq4xS2INFTXzmj1dX5NH4Leaqmh2EI81lXUAHEHNOZfSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C1606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1C1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN69BMv1011310
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=; b=IZM5WtfLDs16Xb1d
	OxE+40nA2QskcQ4WGzwO5J/mOY6BJuP1s41V0cwcbs1a0f4gWh/iTZANrAu34GKn
	/JX8FDlx7H7XSZQWLA13s1Ctesj5MRSmKFp7+lW52J2inB+qiQ22ukwGz+WIPele
	55Vk1UCKLrJEnBb+rzpc3YD9w2iYIHy0OvEAxsHRMJ9RZa6vNoNLNc6g5ziitA9D
	yFA404bRGnm2nqXQ2+3OKLL/CQR0YQpO9XQH4D0W8966bc9xLZ86wlyJj8ZQ86dZ
	Jo38/4EEGKhov/YCB+3SqsGfjEHbvdr9Cb5U0q3zvD3AUInALKB9F4RWln6loOUJ
	5eUgZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh010k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso1643436a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414759; x=1796019559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=ew+NZLprX0gYNpImVkaKyRc/kNQk/w/RrlxdjCnxxE+5xAGbL2q7aXzcAuTtKAKukL
         Vq13s7QC5DM1GfTCM9Zd1owd49UpGOYCc8aGQvGlTcjezYRyLqNPwcaEOJUN7l9k1vqk
         3859sgS1SISIS8tOg56E7uVa/w3XcuwZF9fKV3tbitBr0eC82c2gR12eD5QB3mlEcQro
         s59Zlhu231Ifa1QrF9v8Bfa0zpuJ7sseWIKGGoX8vYiK83PCt7HwiRe5JVhnONqz04RW
         5lt3W+khFHcWUe4f59oyYfvcH8Zo6w/3yH9ZQiDm60imreDpzaGTHc8PL2U6YjozOkhD
         K+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414759; x=1796019559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=JeuERdERNWEUDii3SotDqUbqh3VrlnIpqIy6y48rz5qiOCRqEgsVIaJKddnn8NjgnS
         AiT4q4jJ371wSt9NryDHptCQvN843Ff4vZaH8D/kv1XeBS93RwF/tDWLdTdNWjhXWk2w
         Y/PoFCVuikIIg063fvJtXJ5aIrwYVJkBVM2juBGboEc2oAoNyJAMg9Xj00hJllEo7vFG
         YzTl6rDMgfVmLZMYbQ/g/29oAmpqtU2GZLR1M3oOw5mais5IgJJ/syQmpTeM1TyDwiRi
         gSCn321GhBpce+5hZThCu1gBF0kfMVS2NVyFAU+yx/PixzOhgcyfz+EX/cmwv9PAXBF6
         3EWQ==
X-Forwarded-Encrypted: i=1; AL+hErHrW/N4qkosUQp1FLyZNaETqg3VkcSktGzTKCQ0fPjc7OU2RTABCRf6+QEBMG9ylclTJNFnLUhWJL14@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZMrI4p53LjEXNjx93DM80fjInnchrTnZHfQZruBjEY+TIzsiX
	74pugdjQ9M5HyUUddhkSTznnBBGSTy4BglEBLIGjskHKRWEFcweTJqTA6iFdkwZhyfnnnvVstEh
	dLQtmEffsQhqsLiguyuM4xCV7vdvr+x9REax7iNcbL/EgZE0Zf7iEr+/KrSVRSVNn
X-Gm-Gg: AZFdTZeJJg7oFS8LUhzExGiUOAGLkZFg+SBXNmpUNV9qbaVDTii1uzTsZ8tQVB/8YCm
	DKlZ4Z7M72kgJXNVYYWjHAuzoe7uPg/hP/ajMI9/59bXVMgBQuFUKmwWDWbRtk746obtAoiqG7O
	C1F3ul5ED3Mn4LIxbRN3veSm5xCsCtR6q57T1Dmh1xcd0kwiaowsB4PHf0FC2OnnES8Pvc7jpmq
	r2J5ea46WTkKppfj1jwQipDX+AFkc2nCzCe1FXvtZ2AtxXJtOLDRAu0TH/8MYZ6M2YDcA238YWc
	xIg2uYy3Q6to9oWo+FKM0h96y6/ZA8LPm8tt46G8/yYgz0jj4L7swlaBMWpyEBE+v0q1Vyngse2
	NGK1Zs2Chv18c6NUaBERHcdDpfk1OZ4UYp+XCjmjtAZ5Muwv2Y3VlRDl3O8rHyDK5QugBxVH55C
	5pOgeltLMV2Q==
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414070637.82.1795414759160;
        Sun, 22 Nov 2026 22:19:19 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414058637.82.1795414758727;
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:56 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1496;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=q0urUXoPpzalUSHd+qQCncB0vMYbbN9c151Qoe8+FlU=;
 b=B0dtJAPHvUdcfAhfswCOZ5J8atpc0/BXt3WCBPeYhbtWXTn3XLr4tkCgo7fRBXQlTu5uEZvhK
 HkRR8EnuK2RDsQtF5UCgQj3ko5YI15T0nxcGJkGnG/yy07tXH2SA4fE
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b03dae8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mNKF3LC1gVCpUj1y5nwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX4k9tIKYb9hUP
 YyeCZsgKvUwQT+9ZN2QpnnOsMAvkYvBL/mBcphlZQ670n0btQOBy1loUyasywHpkY+ym+OqiVsU
 7iHqpfGtTbMJtDj21SSwFch8T1uUU3A=
X-Proofpoint-ORIG-GUID: 2vVD46tf7uQnWGa_nuXCXYEJ0ePq3Df6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX1AbfiFdrl/u/
 xwe0ac8fYS46JoleInbj+roVmSUMdG/JNrYJ7UjYKWY+iuK7bv5q/hgxcqtFA2RLbejevrmyT6B
 H7FJfT3VCs9nCWpR2fFHWI4uacOQL9bqv+rReoIJTULgtQx1A4Uwx5dDOfnyT3LVK78NcfNJE5y
 apjoHp1bkt+NpPi+8IfDf+xau6UjwcwhkSSiMXqe8L0aQbHhjAyEI1+/Z4TTiYF5t/ifUxLSz0p
 gtFxJLgD+I6WH9f4WPGSwy7Fe7+XmCV/5W6Fig9pGSmW0cewFcWY/tRSwS8j6Ivq+gDBdUCqWAO
 +wNV90nbEncEOY6kwxbYV4P1s/+MCWEyCx43thTqKbe9eXf/30fSo4YfiJE9iH/PoyBf2sWsDQK
 V5uY3PPqrvDZewClSa0rplndftSH0Kz3uUH09D51qa7vBuJC8W3wQW+hvx93hxjQrUVYxze/1Z/
 9xRvHvXaMyxW3llE+9Q==
X-Proofpoint-GUID: 2vVD46tf7uQnWGa_nuXCXYEJ0ePq3Df6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts and results in XPU
violations.

The violations are seen when Linux runs at EL2 (KVM with VHE), where
there is no stage-2 translation and the write-combined mapping takes
effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
as Device memory at stage-2, and the stricter stage-2 memory type
applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

