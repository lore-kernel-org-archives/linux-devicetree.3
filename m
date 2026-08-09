Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3B3793C3
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310972; cv=none; b=WxnZUr6O+70GuF/GZ3BP4xWfP8PJ9S986WWGTSbqadsxTNU7luqMpZZkQZ9N3B11R58y8qBkFz5qXnZkIxS7ZGzh9+JRvmZRxKklZBCE7Utu01PrQPi3GYv8Z7yEIrERoAkDhdbloBv92a3I/y/OMK6xpQrtCZED/LsWnjdtCnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310972; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pk8vHxitNZ049qx0QDDfFMSFSDeJAGtO89nPbDjnDfrwFqPkMSuCfu1fsoUgywUWj76WE9BjGfN1wUTJY+0W5nOkE6MBGSprWC+a0CesNayppNTL91Wn7Gs1TiCBT1OUEwoI681eVWpTeb1u/Tc+Q0Igx4R1q+zUnfSQM4uzjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMAmc97c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=at5xwJzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMAmc97c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="at5xwJzz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LDMK24103422
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 21:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=iMAmc97c9zRHPQV1
	4jb6SBshXtg0eOnljbooWPXGxL5NfrB/EVfnNxhAbLif1zVefPkMDpI+1CZdb8/d
	ywg0RJqrP9XsBtrdwizllc2a05+xhuiXvEOHU1OYHxK6s9bv2i4IBWwrMLFZhUtR
	Xlmbdhqa6kEVkboObUJ1wUt/PMeBTMwtu7Afi4zqt9u2WyI0SlUDlUTdt5S41cJ8
	G8YfXhS/G2I5Q3rrGtWgUeUEHqYoX4XgTJM6WIsyhQfjs5j3V0Nk9c/jKKuEr7zX
	9saVMSnl5/vshuTt7SwrMwMGaZBI1wnsLtiAbm5pcrogeUeAlg3ebZl9Z3mujUE1
	6llCZA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xr0jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 21:29:28 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6abfca68so25797267b3.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310968; x=1786915768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=at5xwJzzFYZekAYH8iYv8nmUA5xVl+OxNKRTGN0MassQvhyy+AHk4TckLTDHKwZqsF
         jIF440kb7MxVBYUb+jJ92rdRZYDS1gW9lZWRRJMss5WaS4wW3hZlyoSFcu6DMQN56KB6
         UeEwCX8caLz+akj0IEEDJkvK5/FJJAbzoEZuwAA3R9wM7kragKK5aaUZ6dF43Q5DkQo3
         Yh2zkxNFwXe4k3xHI9OWHFPj3P/v+btE4p/+3xVzW2rDF0ODNoWguSZBbVzjmvmVdV2s
         N3dnbDmnjH+UI/9AytC1yx6mQ/50weL63C3l/SAruyOZjYxt88vaqZMFDnFIyd6i0QZe
         P/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310968; x=1786915768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=EFCWIHlgb5sAyPm1kG2nBDeGyXVFngWym4QY3ZfvQInIZBzDNA7z8Ky+Kz9EzR38+i
         ZMXz3+OEk6CVZDE4gfnGaaPVK4J/ZQY0XpNM343QtUd2gcw6pnATaMz5eGV3SiNB9gHm
         H8fXxBr4cA4Q46TkVX61OSojWiLq3Ub2INvn3dIgkSk8+PK5iCLCyFpftYshiEsq+Xy1
         cbhFUjErtDAPG+ArNWk9+GAPOpzgL252ng23YEhSgripBN5AI0AY/qVbN8L77us2FPqN
         azFgUlo8+J27pMvuJYl5d34MZNrBDWviHgbBGHzDyq7QtNKYPmEcs6Dv0T5yhBI3PbEo
         GilQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6VDa2t377gxhApmppbfRjWwGGDyVYtY5wXUU0W4q3bdcaMTBthPWydQB+Tm6DThKtqmJqceHMwFW+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnaBHWK1ceEDHfu1qn6rE1BDtLCDXV5MRXIE5JxE431Wz0j9N
	5m+xLzO17NHBanY0fpsNmtR/1CLPufkH4mfwgaYEhg7JQd+7UIYlP+ty9+17ZFk6Ka1o1tGctpj
	N/MDmEL4sWv/WZmYQ53KCSrWJcaH/MNMQ8S7v2wu7PsL5/f5a2oRn3crm15pL6fx1
X-Gm-Gg: AR+sD13xfn61jzK2gm78lI074ESLyq3QQS6Y6qLVc4Gev7Z4kvXwVPWzMDUfarhP4Eu
	UZ02RnyEUpW/JKpeMA2pVEVTnlfcfU+uUicVA4FqQWMLnDAvbEMcn5ZzxQeIm7iBYMOMZzFeme+
	uck3ff2fHEbKC4IrFEzFyE663d9iQgH6pvg76JqwqIbeJOtiHfdGzfbJY6sudZcHL4Wmt10CSiP
	gZVerFaFHsZRx+O7nBoFzDL6Lf+8id+fPMRRffbnbG7I6zB5RZWjzpZfWLGQ9kl2iWoWTRfybji
	E5y8L+T+UmlVCdNxfJ7A9mIR7FBgjO/ZRTTspybgCUvi/oAsN61ikWtbhazzDny7BQqaoQB3nRi
	bJ74hIOZAzCZ0iipNZCsiZu7ByCNt1JGIWsCiZWtjjdzuy7zgL3GEglvp85iA7pRn/Hc82WvNQL
	9VBw+kbfWp8T0mWzR5OmVacky7cXLHYMr9nQbv1hjchdLy
X-Received: by 2002:a05:690c:6a08:b0:81d:b439:64ab with SMTP id 00721157ae682-8201f0c17d4mr235738487b3.1.1786310968397;
        Sun, 09 Aug 2026 14:29:28 -0700 (PDT)
X-Received: by 2002:a05:690c:6a08:b0:81d:b439:64ab with SMTP id 00721157ae682-8201f0c17d4mr235738217b3.1.1786310967984;
        Sun, 09 Aug 2026 14:29:27 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:27 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 14:29:21 -0700
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-glymur-send-v3-1-2d1ed10e3a89@oss.qualcomm.com>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
In-Reply-To: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX01LdT6prfkjU
 OfZpBXQx9XhBAmO/twvacjrbx+8POx+e5XamL2/PjcJQ3i8DRe5Ae8TcTqg0IGZ2BbO4Q1kJhCC
 us+OZNlC9l6aR8xOhCc25xhIJO95NJo=
X-Proofpoint-ORIG-GUID: Vr-CzkoSUBJcPiqLcNS1b7VDT6SZ8oaN
X-Proofpoint-GUID: Vr-CzkoSUBJcPiqLcNS1b7VDT6SZ8oaN
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a78f138 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX2FI0wHXHqgdo
 Z+4ZcVnXnjd3FI90hSacEpBBJMoMcKyFA2/MUQXLTWI5Lj5w583idgh6/eTbq7rRIJ9WjvL3/ru
 clWhzRMcgsPbRCHksipUP+V/+65jow2jqGH3cIx/DzmTryFvJ2Ex1PdHa4vvOd/Rlbr4aKqmiH+
 IO8UmL6ks5k46blZx4YFY8dSIsgfdzHRwjo9rwwp7XvuoOKUJkXxtnjMJ2yHW8LVyooQv7qhp1t
 kAIT2Re7p2jHm5ZuSNg/sTsKoKXkyItc/2HqLiLIifEt8xTiausJkOFuNJpkYldWuKQZfLkGJB/
 fVswWdNXZv+Njd/lH0jG3TMAJn+sjtSzm3j8ujmILd9iEv5qe6HOtmAAd8Rpm5tCVSxOx9yTq0J
 H32x6fhNYcbmgQxXuQeutVYyGU9GBCViZO1kaoF9JKfJSHfmwfn8rNwSifhyaMy6+RjCN/q3/vu
 Ej4XHhPqcZNmFyQKVMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

