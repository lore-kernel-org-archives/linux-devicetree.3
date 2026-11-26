Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718309;
	b=e7SmsiCB1KxnkOPhQW/uo6L15OXL4vaft0H7nROzlcZIjnGXnX2jazEp/AjTMd4mLOIT
	 rzPyenrOF4sZwfNcTnrr0+Httagi9g5PGdXlxTroiUfJSKTnI/DG/Yz46fgk9tGt+PBch
	 BT6UlnPPHWk6r8twIZjUGVvPGcVa7knfsSnYejPt8CDTsr1f/bYqNk0QO+rvR8kymBbI/
	 tIO6WpNOJTt52F9Ie0zQh0hmvjZRudpf3Bo8BohU2eMP2AE4SAs9FPc+suv6zlaWhoOi0
	 kYWqm8GWwvoK3z9JivB01Ml/6IjW45/Co+Xjl+eHvrN1raFbTc6nu0etkR6syjjK+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
	b=PFXcXdKLuqkwPmZzqwYxd9PZ2d+cqi//rHGwOZxlSdjRDRCZOW20i0LymXrOIqcOSWzr
	 txPxZwKaXB27/BMVJhtGsmEy/CS1Mi3wO7Xa+8EwNBEOBJQSj/qlbP7daf3Exu76ePzrT
	 Y4yxjHPAIovGKguLPrjbbwqL8x/j5dnb66z7cI97psXVNFA26VG6+outgkIgHPr7rDsTY
	 gsju0NdER1fHGSdGM4LYgFQaY5/YbQDw2CfXcynxqexBcZZVHGHfCG1VMQInI67SKb5JC
	 0XcrX7cioXdjqKFGTYRGoK/OfgeYEIW931jRW3JZXOO40KVmj1j1U3+uBu+4UGJ6x3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D060A2622
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7D060A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu2411847749
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4cGi2mqS1eP
	+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=; b=kuKqrbZPirNfBCfa3QKN6gTP4op
	6Zxyk82dv5sDJdlZuOh4mP2Wg1EwwkQ1J6in2wE5fVMaAJM5wbBtVnk1t4cZ6PVv
	d+nczlGzEUj+FG8zV2GKyS7RxlT5VOPt/ZVPxRdAIpwA8YVVbetWJ3Aa/Me2EumR
	/bKRdt2ZtcgKb+YMYX3KqQ21b3nxG7NjY7c/psBtz1kYe/UJF9+du8AND6yorb99
	Cyr922awU32Xy3jVCI1LDOqNU72RlfIzCzZazFgLoMTUxV6FNFVRpdWHaob1Bf0H
	qh7MT9GSsgJmFfSxFSiD+x2pSPYxg8tnj668KIEaqfEmxb9PCudep1cd9iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tf5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso543444185a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718307; x=1796323107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=RCIPHABeYjvdTYSx+RUvTx/9Xn/zZnbpDUQHo+qhN+Z+TPuS21OX0nj9djx3JDYWOd
         RpU+GLjSaLLLWRbFHM4oVVl1xx90hsBfc7MX35YSE98vYHrhHGHl7nHTJaJblUUXdvk4
         QkbNTtnFa2wtKZ8Zgi9APjzn6TJZ9O1HFluglv2/BuPyfi6xU0NLealpjDCBWHiTC4iV
         o3Cngm2v9xUQujTQZYk6wO6M0tfYm0ywsVLcg7jCc4tTZqtkceJzc5hsKA2Xh56ZpSA1
         UcZcS5O3sZ1nWK4HylgR/TU5AQ1jSHtT1Jt41C/sF0r+t89u9ri+bGqsmlZxnwKkjIZC
         EMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718307; x=1796323107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=cydcDTh3DiXn1AMFrtX5KCoam+oSN92RpJGXDw4wb/HNPtkFuEQVh1UUHmppxzIvT3
         nl9V6zGF22Z5kjb+kNP8tlMTBwYRnYSZy02kyBJ2tR193TO5vvt2VCdD5t8UG0WooK4t
         MSR7OBAn1YCinUU47DwMLNbq1tNkBdhD2+VacOOPNnqJL3EWKWeCSa6OYeO3hzKxrIOU
         ih/R781qBIySOsD+pdLndl6r0yyRSYDZX4fWBkqE3BKkrNFYgSYDKefrBO5A+bQ3ffqI
         xUUuxZorOQ3TDJTpMFhu1vnj27nl2w08v9iixMUf5Gm9RcUspR7860uNewbVOkUm1Jgy
         XHeQ==
X-Forwarded-Encrypted: i=1; AL+hErG7OyP40ZFFXKxsoxTJqmh1LedpqCWTP8C+/eANVGLQMe3JM1wsYr08p8UOI0EtMxKapLSSgm83OQj0@vger.kernel.org
X-Gm-Message-State: APuU4Z+yFBwgw9/LgsiOAVox3MMQAI6C3pXRD7qg4VufnRhzRB9pIy85
	pOn/V9+ZR2ugOUsPMFiIApOnWPhsWhoj/KenstMD7tR8tM5aJLhuxifEm6xUxn8M8lgxjj/3dby
	fT3jtJX0m1qTZ7PUkEXv/7sCjILHdl+gtpR79psm6TtbWodZx/vUXVl2MhT6RVtmC
X-Gm-Gg: AZFdTZeK3umGaYD/gk3AvDyeFrm7OisDj5zuCi4ViDmWYlY0fc9yiTinP83QWict48P
	HSx39Lzekej3I54AT4KfCDFwAZfJQCpQLC8H5DzwSoerzMA4NTgusI7q29/azCMJfUiUtIp8RRT
	AP0CHxyGKVQ+Rbn8vdVYaA3hCIQeITgELPIrZaX2HQSTtQIBMfENiKnMwjhr0ejEPE6pR/O8dcY
	SXcVQki9PJs2WdU7KCboJLZ/1pHIWZTHO0C0/p9NnNgjWCi7qejAgBG5xdBqMCgG5qj4HWfk59a
	L597hiLCmzyebmJjZhlm4PhAARVajV5CP26nYzjwok07QrHChTOJ2b8+sG9GBpliPHI/96qTNAp
	TU0920BZCcuX1mfwx8Xj7zDqkJdS6ll+UsqS6YJwoXGKceERWLVncaJQSihoOfQDu
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793962385a.73.1795718307158;
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793959185a.73.1795718306758;
        Thu, 26 Nov 2026 10:38:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:05 +0000
Message-ID: <20261126183806.172485-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXy1MTx3aS55Kx
 /iQfBVK4o5JCSrtYPbgD+JzQNlMGg9ApN1lxZ1V3Xn9xk7Hf8FMP6DJhH9HpRumAkk8dUVpu9lG
 j6URqsxB7Gs8L+TQ6A4ZQxnaNG0Maeg=
X-Proofpoint-GUID: cczyU4DAtbTon9dpj6twhMS-uT9TGuhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4bTGr3OvFjw5
 AgtEZ0HA5Ee6IoaltzmJkAd52TedUv8xAQlVGOoKZVPPDB9Q0IEXCIL3ty5eePDfTyd4vZzqZep
 ZiwF8ueKCK+aH8Ud/9XUhelVPZSQeHUIqy/mIUcLsC0t2BosVYeY9gKzlfvx6HLDNlwZ5M9np1k
 JDh6D8TScD96tVnGGwD5bVV34Jr+0AllcRmprYgZIBGN6aW5C9Nn7RizXhqza3Gem/0ISMiYi3D
 d7cVIsmweyBsqvDMWQw78k54D5U4btZHDbsXKnL3Rf8+nlM6pOVm5Av/YTih73aIpW2OiO57E/D
 znB9tMiQHYCaL63VylaVqk48ZjtPIwnJZa5hoDp67rzZRWD/FTvDgULh7vCVGD74qDFdifluz/g
 LRGmMgsrA8vPslYh00WJ4dLEGaBUiJA2eC0oMfZ2t8m0NAroU2gELLrcRr9X/fKQitOR9GfGufG
 2f9KZWL6Dshge1+72Ig==
X-Proofpoint-ORIG-GUID: cczyU4DAtbTon9dpj6twhMS-uT9TGuhb
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b087ca3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260073

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index ca035f10dc6c..70efda9ba2b2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

