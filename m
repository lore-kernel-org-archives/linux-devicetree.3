Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B2370AC8
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144035; cv=none; b=Fl/BJNMS8vKvX3kYV9OWD5m0Du8OB9Anw0MjCF7jGImKkABsJh64rO5jBS4dKDCgj09lbiyHqJBiAMerR/wcXRY2BSiTPf/R/laHmnIe2wBV2MwOMdcZ82ecf7wFwz1Bb0uFPFooMfXVbgE+4Ii3No9YAmIntHKS4dUmywW+d1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144035; c=relaxed/simple;
	bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss+6j+m9udBVXbJ9YxDbmJLhyUkdTBviieNnXHcu/GEGPcUnursT7CtCOliq0/CAwvxiKPiFKLtCcFyEy4FvUGexdumzHbhnD6megvwWYTNnWT37m5qgj3vK1fU2taj1Zz25WcK+ODMCZQUzGHUGoNelLkLFdWOEIeRpCABC6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKqnF2tV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYg3Q+dR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKqnF2tV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYg3Q+dR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClxpG4084640
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=; b=eKqnF2tVlKNlE0EL
	eXDfoUFkGALBB9Rn4GDpv6bw2f/qH4ABFPtuO7S8HgLWCLRRfUGLPen9h2QGsPhK
	qVw2eYu8ftHlnx9N6vrNWUnSVMlcHg534mgftXaxp2w4Nej+yDU4NFWiDixCWC7i
	ZdLDJCjePzc9eOfzs7lktjLUplBYOR0RWHv1WqhC7Fur8Bg843TbpnOQoq3AyUgm
	J76oQKqCnfg6M44tJs1vTjyqKponpe6q0WeUvzT1AZ3EBX4grz5ozp0+mQvA2gEy
	rOwJhQ557L6MGxcnzK+l9w9ojOiwvyVZjC+bnWcx2F37Rd4GAqRIrGThHhVnwaRc
	JY7qMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb8m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso106524485a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144033; x=1787748833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=aYg3Q+dR9g+If1RONeXCUmGUzMv2f8NeJ/qG8XUbKmKcOxevc0Sab2Ufy41S7fk5X1
         7LwQZfWQ+q6HFBjV2ln+Za89Cp16cUYWSFw0OalDKCTxXkYp/kB5aYQIUnDJLgqrcL7c
         TA+IWDDrabnSK7ZWBTAj8EqP69YNr/0+qexMM6LEQRdSt7R8XWcJtcKJ5yOqIhMh2oUs
         8avsfyQUFqlLZ1trjbAIaGLiOGgueOZeqUxH8IOJBUHD1GGDLgFmZRiVoLiYe+q+pVR4
         uwDcP/9hVoHbYaVKdVHIy35cIV/FEn9VVR6qqDwGqagUP0ohiJB7Ttlun6ODXA2qMqxF
         rrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144033; x=1787748833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=QEkpS9ooIbHbnu5NjXqgxrCNr9ykOH6QUD2kIVCciidCtCJijmpceAe0+2Dph7Jmbz
         3Q4MOC8Qv49SGhQzonwIm206/LAQWcmHsdy82sYwYpxqI17bU2v6aAz6lRoAT3xTQvTJ
         teDFb29WWBPqWbVUBW1O9c1IFYQY9i5XGdi5XfqNsrGlFcTx7KGonhmWkLXWpdVugkyN
         HN7L/s6elCUxVH/UTJQcZ49Bi/91mgG4Vuf7gqKk7ShaD5vHq3mXjOoBta2R1gID4NA1
         DN86WlWHswHgNrCewNS4ZpsAIfdnej0kzYbkqm3f1N2kwsIIhQAeja3UdH7eD+lgbKkW
         2uww==
X-Forwarded-Encrypted: i=1; AHgh+RrgZuvGDQjmfq8ukiHNztsGJgZoysOhFUv1ZWiA5frvAJG8jkSs8+F1/1D70NtBjbU88+n1lhE6nK5/@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJYPm9MIETQiWfa/RjF2VEpKgvGFyNzNd9j8IqKNmbfXvof4G
	3CaXtjbOyZxH7TQBlxohaGYhRTWeWS98gsp1/1P6bo3IWr9hP/Rhil84c5Lyil35Zuiaex7c1ob
	X4SbgDpk2dKLp47DvdR24xlYf1K4L/7yh8LmxCoMqj3q669pTRGbw0VE733HQBhJh
X-Gm-Gg: AR+sD11+NKmsAsaBCjLc9dzDHASGhCctTZKNa4TzgxLqiRlsije3/cnOR5v7tGOvEBh
	lb34290WuOm+mpO8AhHwObuAtWFuMl3AkP1tfSk9CFGdTK5vDc05Q3E7IoOomYMWf8G5j/+wL28
	7WlYGp8DZiDz1ioTkZh6sbGrGPol3YiDLaVGBocMHc/I8g16OI1/EiOjIILy32GA8BxOu6IYeZr
	S3mhK8RXwRC56p7V/miLAHj+Mi4ZqCl6juDm5t3YDEtWtZIVAhME/EanDsoSTy+pZ/mYNtMk3qy
	xOP3Ly7WZi4t03bJHTsdultSlCWIDdgI1DCvxNlt1ZrSHbU8XEtyYL9vH88tA7BFghw3XZ8QDvk
	6ILGY69xU
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400819185a.35.1787144032404;
        Wed, 19 Aug 2026 05:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400815185a.35.1787144031869;
        Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:01 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhaczjZ7tB6eB3mGinIjaqsUSEJoIc7yWd8yeO
 fw1Nk8YcdqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnMwAKCRAbX0TJAJUV
 VlUZD/sFXM543f81B/rcNBowHoJSInkay/wV5MJK5cxw+TExb9zPU4WuRg52v1jjMmoMDIBDKyg
 rB0w31N1BlDsoPVLwlYXnC/BciPgR39DmGxwqGnpsW+3EBytTVv4oV0gXYPmuH9X9103WsfktPC
 MLH8ufhIn+qVRYDIVsFJOazWTHwczolCnNeqzJncZ5TDftauHggWe9EbZYNGC4vfnZ7yuD6IF90
 GPtVn9SFGE3BZq7dbaQ7bXTxhjlNwVfHMOukmpcGdT5oDzBDGF9gbVUhasPbOkgvIBiyjqCEnix
 LoxJ/YA+SUIiVjc/VWFUrWucBAg0uNtjZZmIOkdxC5J1enAdv76TFU+XZOimnf/i2yuIV3+4j9w
 KEmJ730nUexOHkR9jWlwfRVr4/XvOoCNOPKNFQem1y3qAyizJS8o1YqrP2piquaR7YSRhkYAgfm
 ch7XUqJChvKuyC4n7PjTH9B6xtgVW05T83+ZfaLcAlxkarjffMShWw7y7y9V/ohI/0ZNvBd7CTZ
 3J/HaqVWvYvRZP9ZWXK/JXSxi/XThugZmSURFUp1kMn3liBe0Uez2zIJFGgmToP8u8Qak5XIsYe
 f4EIaEX4zO/4ClfXphBdKBcYo0ovUnokbxURu7zHMx+5bIH/fmMRIv5d4EI6gHCkqL0WjD9BhkR
 YZ9+ck2tGlPikBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXw6PzUReQuuzT
 YouW4fem+0Y74lAQhrDr2wysX8lsVBZKeI5ohUx7SaHSnlYVFwwA7vq777SJzGLaPXotpoaZDAx
 yN1Hn/epsrerhQ7jnP8sORR0eIzoq0/16BNcIOZCrhhuxSSbZagjq9NPcjossBbvmqhvbr3b/wX
 OkE7SWknRfQ7I2AUGJdUn9YKhGG7PlR6IKUu2foETPZnUMXGd+7COMAQiDi/0ONVtpTsgto/qzK
 nfN7ujWYqqqlRfTfB+BXLEq8o0HsCZzp5D7SODPqHKL+UJVRhXdKeWhCx4k3YwoMh6ui6Yuyjif
 pNHlDBoEQHS5oI+fxHFWgd+af5/CHOpFmYaHjCc5xT5ZM7YgQxQ8SqerVqfa2m5yseb8V+Ys923
 gLySWofrUtPMnRH+uw3DNbqydgxwxWNI5ipljBQZGnNFNwphfZgOJFnxq14wXDsCEvQMAsromPX
 WBtpcnkP1EtHoNOmSzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6wr8lmrN0Tme
 PwKcqWWiSvXqtoCPwPIH+w+FOHeRW2zgSbOXySsQ9xDvwxnKKXjUvAKLWDfStvS/vDquwA8e/K1
 GY2NyE3B7LNDcRzTYntuC2Df0O4btQ0=
X-Proofpoint-GUID: 79F4sTeGnrsNNrlRi-X13ZsZuFdG6_GQ
X-Proofpoint-ORIG-GUID: 79F4sTeGnrsNNrlRi-X13ZsZuFdG6_GQ
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85a761 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

