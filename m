Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC333126D0
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 06:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458187; cv=none; b=Xtyms0wfNdYZmv35XG/1xJDko+8JOBTwco6SHE45LHZQDGUIAYFfzduoWrvnAz0GYGzhnFxbByeiud0b7Ut+AziNbb4LvT2XNpnM6C9BxUo3/RNatXwDnUOlsIiR8dwOnCDJfh70JyU/rDanjXd8Fck4mVq4LDpXwJpn+cp1I6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458187; c=relaxed/simple;
	bh=saMxw/NBj5954kBjsskkfiorkW+T9s+9YihvoBd4P/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIPfbbm/0azq9ZrIVXAZ903KXorlaKFIWJAjM4m+VBq0iwXndfuyiMUZKsWxfJGWusXWrNB0Mfsm2osg8bfCW8EBUSfPDaAqaQcvaNAKSY8V0QNYVZJhiioZ7mB8Bp40FI13EqDsVK+TLsSj0gzIHbHFuaOEBN9JALXRwtxs/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU+eY6xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmtunhna; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU+eY6xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmtunhna"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Lnr9K3468142
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 06:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c6to1BNIlD9
	n9aEhnqLk3s5qJ4MGmi36h3opo7Msjsc=; b=TU+eY6xaWuk/TxAZVQMDjuWZPeN
	lUKC3UE70KSulPgwCReAgtQLp9uHnvobTerGrwS5/bBQHaWqfpe2acDjYN4hn4Ib
	H51kAK2lUWcD+qkE3WpenbdAm74ZBvcqSj77IBszZ2CQMEvi4Unv3hunxtlUhq8y
	CVNrXrAP+JXtbs5ConK6Yca1R/ttDjVBNymbZogcwfc6lqexraYBwi06JW81jUvw
	6qYEJ8OD9PvFCKQMjU5X5LNvxM+GGU8+c2AKKPtlM07MWqrIbBqKkV6UsrWGvqqe
	8ALmd7mQDGMPKH5SGYTMPcUuvnV1qJOadWLeuIi7bWGyI1Hyg3LeKWM1R4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrmc7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:49:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso96978451cf.0
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775458185; x=1776062985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6to1BNIlD9n9aEhnqLk3s5qJ4MGmi36h3opo7Msjsc=;
        b=fmtunhnacoN+Ig05WHzFjbGwkinh6BLEUkCHqA1kbDQtg+B4qXwUvuqa63ePRjOFg0
         7URSrATUfyMN6fErqFOrajcv9CPylsHtj3duX1CbzeofzndWmA7URNGz/ci+aiVfiKwJ
         8ALGQbGCXfdJ1AdRBORp9FeBnjwznloBNWLpidz5pI9h18uURx9VWgazlCpluLV/O+h5
         UPCB4UBdvhFPzbZofVeaFP9NhT1GDI+oIyYZtjQJDzxY/QCCap5CTrjBjiZC4luxuSIs
         tnUtTgMdfaH2Elv7zMfVGGI+L61z8t+Ypa2BpjvhFy9b2UQscpLlTFy6G5c7DyCBvqFG
         3dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775458185; x=1776062985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6to1BNIlD9n9aEhnqLk3s5qJ4MGmi36h3opo7Msjsc=;
        b=U2Ji8diDpAapoP9cRD2bGH7ce7YBvxj5RZayuulVkJVlZ2tkfJ1YJ2QgKpG5HuB9db
         Px930znJp3FaVuadoYZ0PcFKHQ6qKdClHgiO+N8lnVlvIjKg/kkiH4pUmweXv8/UnN8R
         VRFB1OVBQVPg/DjB7BpcEwt369rxUOZndRJh5yabIZC21GU/KezPm1/tQb/gaujS/CU7
         61+E1kuBoFfoEXOB/MnoPgQ/GvIiWsAtU+VfQE4+YSxLMYdeF04TcUlP2b/gTorFgV6V
         /TyVJw+Sy5fx7sf2CaC6cJGauxAubg9/bibAItXuGBpK8WJ1isxJA3ob1dNW3fgVp7+r
         cBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCViYSrnW1v+o4mJdCqUGKXihRWRRHRFmtV2U2UoN+RqLqNcC7iFuw/SXqg5aYToYuiG6coWcrA7F8Zn@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8PsRTfUT3I/+yjrserSo/uvOgBO4wLERetZD2Eb2fqM8U7Z1
	WL7Zi2CRfEQ86pSPXD9YLZCD6b42+buQzZLlDO4kv9O37f+1eCDwMXSZ/1XuYaaLaXBte6iV62v
	CkLE0NJLt32WALSZA2/TikSZKhe/6YeW40ao5REFgbpdBNwcbYR8XrQkerZwRjo0U
X-Gm-Gg: AeBDiesF+EG6N3FN0Jdo09lNiInFqJk47tMMhXWSFGu8O7iRXWvvtZN/VtqmfruOXdV
	LGdTQLjf+5c7HXvoT24Uy1B+1a6iCU31COEQbxI9vEgnyOGPrkSqPbG3xjOLkiwnHNs/pyxoMFo
	PcEr1qky6suMZZypkIe6qAKbWQ9xiwiouZ+9mJkcxumpSChy0nyagMXk36qc9tlffF/NROA/Sm/
	CcyXzdpOX7NlHEOQSfqFF7okENP9ESH9qrLZQ69atEOCPfx/ML0mI2tNqmfyw6j6Uf96OhKrduY
	wcQpLB7wenqBwgt7KoNAJOPmETqoMQVvjoNkswDh5bXasDL+5EoVVYxWIzbB13clP6kmA+4LeOm
	nla0uBi8aUQlpNeBxQYagloJ3NdrhDjlf+CgV
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr184577561cf.23.1775458184853;
        Sun, 05 Apr 2026 23:49:44 -0700 (PDT)
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr184577371cf.23.1775458184485;
        Sun, 05 Apr 2026 23:49:44 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2738sm38990714f8f.24.2026.04.05.23.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:49:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: tegra: Correct Tegra234 p3737 interrupt flags
Date: Mon,  6 Apr 2026 08:49:37 +0200
Message-ID: <20260406064935.27968-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406064935.27968-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406064935.27968-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=saMxw/NBj5954kBjsskkfiorkW+T9s+9YihvoBd4P/c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01eAsFDmreX7FtDgTb827h/pp9ZZ7LRp8/ArX
 fRVzmw2IgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNXgAAKCRDBN2bmhouD
 14U4D/9O2FXAUVRIMwH+UJKo7xqwK/nxrc0qJ1rLcPKa4Ba+aXE5R5yRavZeySx22mlZep+/wnp
 vKNepXC4vBwuksrBYpDYGM5cJ45N7UF68uQ0o2tU2CPIl6oKawIKfFWKNyn/4D43gF+YaZbFZ3K
 sQ26lN92SYAFnA+yDJKvnOyzR6FePrFU5mH90Un89/MEVGAesmicDh9tvr6kPoKvQGJ/PjIeb7L
 F4AtU1lCWIyyFGvK3EQPWi32NPRe8RU/HKaGehwktzOAPOXAw7ptSmLe9IumA3U1Rv05h0QfXOc
 sZaBb0HPUt1VzJHr4Mc+iQNIUgdciC45YKyPqI0ZgPpz3cldGbyycb+Q3Pr2Nw5ZDMkJ04WXa+6
 Lygbs0LxBghwylsYfItgE6SoQ2famujIRRO9QxL+r6jje64SdnNJ+rrsNK6ri7v6ebm54WmXHJq
 4Fvg2Js7QISViGAsTvN6T71AG8H8AVuPgSjy8wU5qYOde+C4m5MspHuxKZZyZtq93UX8PkkbMFC
 +2LuOXoief5TeIdUpmUuz37gmxPqe5gTdotHnaId6T95q/boi8p5YWND9vGlF7E0bkOBxrptJmi
 q6tFQm+gqnlMxnoi56OuOdPEXq6SO9YBhvP5Kcy+Fu8qGw38YSC5O4r4H7cz7LyXaiBh6j3eeGT SWFGWOUW54tjsmw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d35789 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BofQnU9PkdiCVH9erbnPeF9sALKSD36a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MSBTYWx0ZWRfX47wGXZTGr1AJ
 hQNY4VQcfhmQ2+fXBJNrOCwwM1+w+ASo6wwj6FoN4MmtsdPUWh6sTj1H8wSfFPxeN9tGzBuuTtn
 RwCyn+xmnWNcqBElAC9OICLWQ3pFJ4IN274JFUvBsgJIfoyFls/4o1f2/ubBywVj48or/3boVfO
 EXYswOyjv/NUTqc/lcSBeWCuYj9vYYiZ3ZkJXToV0YYibhI0bvSQpXb6k7mUXUP7zl0I3ZBEK7u
 7AY78A5xyANnRIYRQuDvo5D/IKFUFVC8j6Dbbs0LbFejZaK2pIxnr1/WX1oo1Yu42XK6k90q1k1
 ChQXNxRRo7/UVvxQwt1UKVVffFY+6VP1GsYkP4nHflPXIGkGwU/1k/lpyeswCdRqEA8wGuuehVz
 vfi9EXA3ESv9Od5Knqhs7PXNvkenDpiHMmyY1x6Wf5wD5c+N/tTKHKzXaUM98qSwoY4AiOJH4Wm
 pPyIceKcxFbtUZWDArg==
X-Proofpoint-GUID: BofQnU9PkdiCVH9erbnPeF9sALKSD36a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060061

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5540 codec driver requests interrupt on rising edge, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
index f6cad29355e6..420858a8f4a8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
@@ -67,7 +67,7 @@ audio-codec@1c {
 				compatible = "realtek,rt5640";
 				reg = <0x1c>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-- 
2.51.0

