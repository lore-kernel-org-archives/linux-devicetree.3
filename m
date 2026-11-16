Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824397;
	b=uRRQprcbijggjwwPxPS1scDRE57tfkl0COFkyk6h+sGC+iNlaZhuFlvKG0RHzkpUhE7n
	 wNZCbdINH2i37p3askP4uxgN7lUfIGGj3pidp7kZmRbCf25GjVQbwV4rd8dA1dF8P7TLl
	 fDn/CSI90tiezMcswP/s5qv/RGf/EtHM6fr0kRh7hw0XjTyPNYwT1vj/xc7jIPF3DhR5u
	 1uUU68AsViJgh9S3eHTSNieAX1BzofmITIrGsS84ARn9zMrUPnpfxRDneldVr+ozK3GGD
	 +1SpGnxwIrJ7LL1GoAkwbjXTTNbD3f3Aa0dOid6hfwBmUxFoKg9i0TKWGonLHWg46gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
	b=JQeaIzSFr/5UuOSl/vPISf619fRt+61xDJZYPcsjVP/arx14cAVJvrIQR5vTEsYNdg+B
	 ETvTdN/f97QmE81m/SEONRPv63m+IXR/QmaDpK+FXQW/CoZnL0oSv59JOB2p4OEFJuwIQ
	 P8QeJ9OqCthm9TWbJeaD88bwhtqUHiG5u/yXcz/XkAxhCyKfAKcM3vQmiqLAmK9CfHIhC
	 3VDHbz8tmb5o6bYXgpsBTPuEa844xYwfPHHEzz4WvnQpAevYQPZEN6ETHRi0nW+0lhVUA
	 DmjU0UvgHjNfPmrtTYmV8/BGghGeQBdwb3UoB/oHrpgy30V2/M5NChSS8XJ2z/y3raA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InxAuCdu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHe2RQLM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87562606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87562606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InxAuCdu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHe2RQLM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA4Jld1227993
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=; b=InxAuCduqqhr67kM
	4MJPcxWu4F85hnhTRnvzPEvilUprntVB6Kg5G5C0e2j1MukC1gT8XHshX3ZpcSjx
	yZl3CL1jRAawSvzM1+L5yt2X0FfE9++QzR4daG/WynvLzqEtyTmdsDXLuM8cHtuA
	CfFuYt8HtMvFMLCz841idpNhbM+xsGxgPlizvvQCIry8QRVCXEWJx+lz/43WCS4x
	bOWrfxn+kF0f+eQmRQWNfsqslkeTcBj2grCyZ5HS2YzeLp+4BYGtq5qgt4DfNGc+
	6lwsvK0R4cJytb1FSB+OHyg4/jRSNX13WCY9VSkhQpOqkiDfQ4tJI2Sr2hDhXdT7
	ZrsPFA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqg1v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:19:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1758656eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824396; x=1795429196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
        b=WHe2RQLMJ1UqrhUcVdDirp9poHsvHsIbOr9ZIuYsVnuCHADTBETxx3T4XH4eEjCeyj
         VsHKcBGt3je5IMNYCVCCcq/krX4i8+K0TjgugXwTvB4+3s6uzITzf8Id2JSznvbiF6yu
         aXnxjAbgA6mzoXlGJo8ymKU7heY89CK0nI4CbCUgsQeIgbO7JZpAbzS2DGaiF70w/e95
         oQ2ZP2HYqNfFAaetnPyHBB9dv3WG/OM5hGUox8jxdWgKklHD6x25Pnik4oBpz2SRpTky
         0rCmBH6Bj7ZXVLmo4vgwjRFFVBMmaHCGywnT0abGtQD+fMcKNlPuwbi7LFyFx45mW7jK
         7HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824396; x=1795429196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/29wzYL5hjbrZK+L5pG+5RIKtZiSHZ80bCt20C+U4BE=;
        b=mJkWThhfCoMN0B7v6/RjBHkwQ68JuIudbqFVQSvdHNHQeYzLpLlXrKX9vSfMT/gmEg
         GAiInlqI1sJl4kkQNDSEXW6h0myP/i8M8Dema7v3L8a/HMQa61+9tzMRmKZz562fokMx
         oZ1hVNu4lcDcw+BRHMmWSfNlDwyDw+EGT+tk1XGwQb5Q4kuV90h8/HOgoO0qzEF+NXfg
         R7Aov5BgcA6jmwlTnNwj3MgrVvEcyjvun5zzKidPcsyJIg4RhD3uZP/FppvqLV7KOMMn
         0tGm0Zhqhj7YVboVUICxUy6bjICpmDjVTiFo178FvS+ZXuD2sfZEjQvJoiwl+56SdRMp
         Fslw==
X-Forwarded-Encrypted: i=1; AL+hErFv5MMClt2EkBihHYpb6wrDZLCOvcKUPUEnTl5iEmAmfFlKdypeHNBn1NTjhXiHxkxD01hWRsmDdqFd@vger.kernel.org
X-Gm-Message-State: APuU4Z8qs/kxQykx0uStMQyDzmfOFkah64XjHOSeIkraI/2/Ks0feJ4v
	VQGw2pEZbnls3wwULdo9ihqkWHEZcjpKqbMP/y6k7ZNXNlvFOLTjWPegT+Ez7hLOx+/Nrdenib+
	XnZ0ZjzfeUJPuF3UMNcolpWVbYzgCDM2cRbb3LyUnnfCVi0K3Z+a/brTcH5knvAmV
X-Gm-Gg: AYBFou30aAxlnD0IJwuVESXJjPtKrodNVpdebKcGX+JUhPw0663c9czX/J4I/gVbkP7
	7HNXEPbx9RSdL5udxqzsu4pqVWWx50H/z3GbDGiaXm4hwn6XE/xOSpk4/Q55bW/iJCuJkyAYUcV
	VYvJSbl8rMQp3Zk/AoLDWOS+xyjk2+WOU0fRYy1vPC49xowNKVWK+1g+Denu93wdoaYispbRyTa
	xffjc5ZtirdGlnWMhOo/VB1klYAXZbVmSSIKbG3SAwIhD9QRSeWhEYEq4b/wLMIOItpcqA8kMc4
	zoux+h7uXtpzwNvT747Uk4IUtwmOXX1HUi0WZf6TsHzbayHy5Ktn64lV1uqHOr8BdXlYZN4xWy4
	ulnHSqCm+Icl+n80X5VfxWV2jni5ekuwLQWPzmh19M3s9QJgVqJw8fycAyZxENha6p/IyvcWnqE
	7NDJ6/TPZ0MK2SUgqJ
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9380707eec.0.1794824396168;
        Mon, 16 Nov 2026 02:19:56 -0800 (PST)
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9380690eec.0.1794824395719;
        Mon, 16 Nov 2026 02:19:55 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32599557eec.26.2026.11.16.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:19:55 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 02:19:48 -0800
Subject: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
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
Message-Id: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794824393; l=1065;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Fb14u3Uh0Gv0knlh6Un+7Vkp8cbUQBriP9GOv5lWagI=;
 b=V7YGsYPUpWsnuewY1heonI3tkDNpBSFcmTeztXkuS9EiJLIyVBfXfSuDoPS9v/cGCSKqOYtuH
 0LQ3NeruA1QApWabdBPl+ID0VuXdZVdkjV14rNqW7i9WmV0H9FJlWO3
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afad8cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VEHikqRv1_aYAJNswC8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Cq9VJJfaZ8Hdgqq7oA4tMDZCsjCTRalm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX01wgoxYKpuq2
 U71BYKdEgJ8Fu6a/OQ+GxJ7Spw4H9c/JkWHamjeJjWS1pVkiokIQ1KDvzphlj+zxHtg+KusJ/OA
 B4mWmreekS/Udb3b/js9NgyIZ4XpjovFsuXX7SI/FfqHHRNXDfg2ANzk2xk3XaHMa244aSGj1y+
 cQCkM0A78VkGAB84GbVNAI/Uv31psC1XtWnwcv3BBSF3AMSZovLXjJ+FeUvOGkkuJjZ2u3AASay
 AzcMQOVS69FzlzZ31v+AThpKr+P7hgQNCRWnF/SkZmO+hdfBnsFO2wdVfVLujznXD2JP9sxaWJk
 C3+uM0STzwQ3Kawco5a9TzaY0IusnkfAkTl++Ivc6yczyqJCTsqRzoy7IthstOuytHXpPLV7oU4
 bGzTcLS37RGFGncaPqUEuIlloO1ZR/lH2/N2Y+RKXr7AxD9Mw15WdlEyvdd7S8yGNDDTLrauh+O
 0hpv+/l317AWQQ2aXpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfX1mVw4I67wKr9
 58s/r/fWy38wxVGKiXa+jh89L9xVEv8POKM+JV74HcOx7l91jQwGXfrkU0wG97UvE8C7dwdeCc1
 ywZrTuBEOXccsUpT8CB4ZKQuEVEjnKY=
X-Proofpoint-GUID: Cq9VJJfaZ8Hdgqq7oA4tMDZCsjCTRalm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160039

xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.

Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.

Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..6e4de7c29d29 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -27,7 +27,7 @@ sleep_clk: sleep-clk {
 
 		xo_board: xo-board-clk {
 			compatible = "fixed-factor-clock";
-			clocks = <&xo_clk>;
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

