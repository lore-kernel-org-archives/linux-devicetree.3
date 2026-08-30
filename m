Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E665385D62
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079259; cv=none; b=JVipUMUwAQpaxqJIWG/A11NXPSGNtQM/Vsm6Mi1keIFKu9patqQSKXKbXn52/WkwJSmBrv/1u0es+8Rx8r1jFhqrcEwpQ2VXUIPWW4LbKtmqQpBTBkDig4gpLUhFjI9kCFdI+KfrnaotA/+ij9qNu3MqJ5O/G6OgwEpN7x2HV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079259; c=relaxed/simple;
	bh=xstTPquafbNGlKwlQsKZ7eJq5FPgU6WMbUCfJXuADdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/5ILFmSGz2cHUtSIPJEOhSXExBDJDRtsd9riVtukKYbRfnwpF2772vwztOfuKxcHyOxVFutXoWGql2Hj3fhbE0uzg/jyPOE6Be8dqKHhEyqJVvygKrUmmzbMlBB7/vAbV1WUj5nQAA6kA7qFwYmqJu/ER+5NPLXslySVxUgAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5IhCqd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdgM631C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5IhCqd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdgM631C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U5w0so3423100
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 08:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3E
	nSqqfb8w=; b=S5IhCqd/1yiomJiHtcsSCPVCmHL/DPZNP3Afc88iJsUa4NgF2+H
	+u6Vvasdq3BRQ7Qznqvk8FONNef7TuMqgNfkx6qbWSIDUm0kRgdIBEXZQR5cWxuc
	5ZXl9nVNrv3H5EZEHgS8OdEMPzuglitZ01eHLTEHuZk9qvjtkK5YJTrlW+wyDsLU
	7ioH9VrIstWJRr2OmAI/bBMlzJNq6Gf3nXEswresLi5y+1ks02H3qw/cxt9pdbbr
	34YICvvBsM7o2reA9bngHgAjmWYgr5lXU6VkOgn6+n9Q+NwKFBNuMUqe39Gi2fZu
	Ar2z0lmKXlxznMXO0fnwsy3soIExWRxUbaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dthus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 08:40:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f52ccd459so37013751cf.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788079256; x=1788684056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=AdgM631CVn6rLFXVMAAQzc15dta9Y1IQcD/2tNHkoY03hSLYSS8ExMm02oap5LJXUw
         JO7vhFEr4gtiSCLvhCTQ6Mc1FowIA9b97fUb0XGQJTtYD2A97S7jlfPe38Q8J8stvdh0
         Ofr3Ir/9TNS4TcX5qSdOM/NKy1dbaA1C4RtrxvPcKFgq3j3uW6Qobr9l7O/fA1nfVI/o
         O7m286U5CXUcCWAkqVrXs5k7RHXEMDTjbd8HCLDrYTzJjDyRZPnmoTs0dlsx+23IjQci
         AL0un1YHocBTDxG6nBC2qnjyWtbQCbxqc7sV5cFnilElKXynApnJCseOYq7qfBZBtVtq
         9kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788079256; x=1788684056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=pi5f4l9BWiHdhAbDf7QhNkbKOmKoj15N8DFsFGfMLjOKFzFKfqD1D/S+r1YqXJfxr5
         Fx99nLr/sEVa7JFQOj3stcmSkpG9QbnF/9ecC0GU8NGRwBF5xfKUvko/L9XFKV4yYo7A
         Q00/Xn+FnRglRELwTT8gZllFW5LUDhh/ycWrq/O3JD7V4/SnvYwu0+fF01vOKdB9+svf
         ImYak3yDOHTAo69sHapTbagXhcPkLyYvN5ZH0rrGP40h2Bsph+7Q+z/aOeKfzyFC8E7p
         TP9HN9lY1YSUCgjfUjjr67Oklc2s8LkyVss0ShzCrXpv7iF/91nejB5IJmYNtHtaJei6
         S1tw==
X-Forwarded-Encrypted: i=1; AHgh+RorVO4gzZ1mxejJ6n8Qb0UPv3NXlsYD3oMzeFfayiXd+TtrbKiYG4CjHrALpUKdVQnRyP/LOBVkX/gn@vger.kernel.org
X-Gm-Message-State: AFuF++lZ+IZMHpso4/WO3DKf68WQrKLaw0dTCb96eNLewfTn3+RMOwgH
	niOEB0UEykZS1kJGpP/jiqlGTDZ/Ril8cZXIsKxb036VzxhUsVMA+ZBMDTmrYuMI0ruc6sl8ACU
	jdnr/+hszG+qSU/SojZ1EDXtyUh9ytFPPLqsPHzvpI9ddBFqS6x7MXhmWgn+Vo2tn
X-Gm-Gg: AR+sD13IAmMCVDtrDe86qcbwUQu7D06y7AKpiojp2mPBS/gKM48Htd6LGGmXl1QjY+F
	lsKhN9gviobL8FAlDEVb60EW6R9Sy1satJgSfR/nBfaBYYH7wf5iJotClfC2mHCXEwTI6of37Tl
	pFRtDajlWD1+MQ83vq9KvD2w13qTTPPcHuAWs3BCUHXvOfdLraNrbb7kf+anEinbMhQXy6N9GIW
	//4Z/Zhop1xaI2uegzlf/28EISt2AcNKNtOwhgkjM2KyhLqCJb8cBIOoLh0rdRksv/HNVOwjeTH
	+dHPeIn8o0ZIftUXdM+Q6uWKtWrfcqOm7Cziw494tYjSy51GerpmPhE0o/Q238w3vct9OTeaTZF
	88BPuoJLcv8Yks20=
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644561cf.37.1788079255885;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644401cf.37.1788079255534;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm314870005e9.10.2026.08.30.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sun, 30 Aug 2026 10:40:47 +0200
Message-ID: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xstTPquafbNGlKwlQsKZ7eJq5FPgU6WMbUCfJXuADdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqk+yOzvIYQOZZBzBQj6W1Qw9AqvmkZDdJ/+c6L
 pnuewph0cuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapPsjgAKCRDBN2bmhouD
 1ytkD/4qT4rdd3yN7yDIh42thkTo+Unwa2sFG31D9cU3y7Mjm2p5Xq0Dg3hI7zzGFyqWeKDZQLd
 ow5ABRV1PGgwuEic9y2reK+Okt+dWElZBc/09FeWtcJY0hRcUSVZpTqpdSOCPfccLZvWBH44Xko
 tbK6f7710D+MNASE4jDx0xIyqEdMhSNwiJscYiKUKucg1MOSufYlRYa3sj4E93IWZZF3SOWT5ga
 r1jT70VNPX7FiVOTquQoanidMyYoZDJvqjx+3MpoDPN79lSK2w1HciOsoD32E6nGW9utrc0kJlx
 OPbwVKT7gISsR4j4nKtI1PtSY6H3Z76oke4iG+QYkqyESDzfjCFFWhOKK7Mg1FIWsgWTVgAfO0i
 Kv4P7rzu3/MlT0CdTzBVG7g0mOLLMWfD0FcBypJ45JUxJtdXyEbDVGTf/kJdBT/p5qTUiQKl/wO
 W5ysEOZiE150cZWvpfrjsobpzeGHXCxpusk9BqLgHLQr5OUlDh1KDV80IhMR2NJtjdxpEubuP2s
 mBsBXlHJFPCOmiRRwGhs6gwUFzAZBL8ie+o7V5DRnMaztcrN0wPdreMDLCDXheljmOoLfZyhq51
 O4gPbISfvBcyvAB6QfgVByG7Nm+kk1mB0aC7AXVsxEGWkGSM3BikOf+IC3vXPkbgmE6GVca9zN6 jbEY2GFGR+K9sHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX4jc/0XfjptuL
 ZsnIIIBkAluJO69DVHbOrC1kMgb5YrBzLoC+RpJeQnc7zoO+GcrXFPnh1X6hBnr05tIYEDnn+G/
 RjHRH35Tw1Akbdobf/iYPa4mHohk7fmdFWuMh7SLfUc66WYvoVcjfeoFxrS6hpB40Ro/EdOHiJE
 /e7v4IraVhIv7cmNcu5me5awFldK65XtNPcj7EIKm6jpwiVD1pA/PPp3CApH9/Vn4jPPS2zgJCN
 +mJMNko1YANeOkpkP+9FqQOqFLedbYS1NebhhQ2oePbM7xrLXeifNNKBZYeMSjzMUqQ55cV70xr
 AnhfyhyTF44sKIqAYBD8g3X/YlwWe84IT3z6oz0VoSjkPQEypadVaQa9HD4sxHVv7h1SoZ20pw6
 7pQGFkr7f1mo56AqfjiPVvN8NQeBmBxntXas8j0pAcvhPbAlL4t1pAwjA0kuUMulb5Rn3114rov
 uPzUozrnC/Dv1PU0c8w==
X-Proofpoint-GUID: I9wz6Nt2LEmMCOKYRwvqGWN1CSw2EUuY
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a93ec98 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX0VHp9BInBres
 y45rUuja0ap0Hrse3uYZI/uHEjLk03wFzqh72LETXZE38SdDF8maW/5Cyqd1ZpW7z6JxpADqdiF
 OoyASU+znyOY+Lh60XcH8c85/vxw8qs=
X-Proofpoint-ORIG-GUID: I9wz6Nt2LEmMCOKYRwvqGWN1CSw2EUuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300071

YAML files do not use tabs, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Correct logic in commit msg spaces->tabs
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0

