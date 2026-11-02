Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616140;
	b=WrW1zWnI2946mASzhKLMOVGOzLsWWYmoRrjGOLtS9JhQP868VGNgFy9y5P6r8CBwnuDb
	 Fn6Hk3aEr6swpXnr3xTtizQde46m0oFLESnBA/sk/CL6ubsNKCxQACjCLaebsGrMk3vSM
	 wY1tQNL/Tuq7FlxRqCJFn/cZk2WxJkqR4XrLpbplTEz54JHDlUg1AOrtZPtUDeFB/gPsG
	 NLEmIj2Z3OSCgdJ98TWSCiTDR9rA79x+eP2gyVerShcw2/j2R83U4EqGxCpo91NK3+qf8
	 nQYy8tkt91plOSv1zuMACih3wA5sucL7R+x+afMilbMqmRuIBjS4N+YOH7xUWZadCeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=lCp9B2rKabacrITpj0jhXbKw6tsPn8PJlh3TO6WK1JL56zNoPASKf5mWpEZRaavqLe3s
	 aIO012FPOA4B2Qnt/czhK9X1wSHh45LZmrCzWDWs3y1knIoXKHqZdAL8Eig3rjxcp96O4
	 +kAPiak1C3q4qXG5V1HWJ7ntMM+W3+rhcjF0qT6o5DjfLqw4TUysVc+AWZ7+2MFQM3ikv
	 Wof3JKuSp5/9Flwa/xJnNOQIZwR2prVyFnz7cveDMZDWWuZfcRt9r6PZT/KLu0PKjRDJ3
	 585vzi9QCfHiI7PjQQLZsJdjI2WKD4KvL+MBHJacLnPpCUTEAoTQnjxWCxYuTrvVJUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F86E606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F86E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvcKXKLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kASAn+9B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMXu1821130
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=mvcKXKLEkI6U6XF8
	/MSN+QFKX4Nb3WCXOdK+nO6AwDX71ZlbEdYk0Zy38uj8lE+Q+ugEKIfECbRYZaaL
	JyeaEwQrTAsit2hNqFvx+uqXXuWCwdM+IQNofX5cjr5cS+bUsrOPAVL/n/t6S+AF
	x+FCEqL/nyXNteBDwrVByvhm09Db/BykPRj+RLbV4QT+jVWquFIp6Cc/DMiQL49Q
	VytibPYRBJPxpzR6uQikGPh0wp/ABYRmr4CWbkzDd4k4Eu/BK+DlyGcuQnU0J1cT
	V97J1bRGmcbDigaubZ6BNss3cpo8VFIwh9ZG6KrRA7AGqEnBWViPStzl33SKm45y
	qhLiKg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:18 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4d2f0f77124so3195430b6e.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616138; x=1794220938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=kASAn+9B0B9WwHKDoj+ar8KmE11y0wG4LbM541s7TfgQ9ZKR8bwlwv9PzD1DW3Ts/o
         FF6O1fZD2Vh5A2w5vtrPSQ6A7AsNXM0yk7l9JhCNdtxpFag2yvSskomdBhvP8hGXdqgX
         s6xUuGu59l5Shxx2UaKbr5P5nP8IS5xC7rw/20Bh6Zve1aBh5aDnjyz2fl3KujV5QN6L
         G93EJPzLNkXGdkWthXOGFOzDDKY5oCu//61LhoWNqfRZ4dpQyG93+0sVKReePJYoyWv9
         G5+2BbJGRZqJABiC/YX2r0+MyPAZsr3rej6fEbGojM0CCIo8EMkPslOaAD7/y24Yfyoq
         XdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616138; x=1794220938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=Ufy1bV6WgfM7Jj0PWlKj0y8vv1lV+F4riDgUhbI++wj8RIqlc/pv+T7LeNmOD5P9PF
         jrBZkDcGJ55qP3FH/9lapgm+l8vm/KD3S1iqT/8rK/vCDcjkdc4/HHiyPkGGgVdTIVct
         /FWPlZ4uIdBjBcEYQ++D486Wx8WD79UdLkEEjX4wPvt4G9phv/eaqeFVjDP+RMGKX0Ho
         vutLuku9mhrfeDbNiG4xjgkedpTtCnkBc88IhDj8oKz8/T6D5JxqiwNx6DCqWHWUSwRp
         OjJMnJ1uKkIbjLdgUROh3GbCJ00sLEx18fYkTmANR8nME3o0p2ErPfA3sdD3Ool2L2pA
         tTgg==
X-Forwarded-Encrypted: i=1; AKwUvBxcJzBnIrQQAjVeAdbi8sVUdC9dxabhDg3xeF/NaBzB999PjwUrfvIhIzeELr13ZnrVU+RxASKzdJsB@vger.kernel.org
X-Gm-Message-State: AFq9FYKCzr1DPJ/pVxLaKmlkagVOqN1Y1jF7rWKs6R7lkv/RXpYNNgmO
	tXvIT/spXbtXQ03lruvsZJlt8yFyWwKEVfvlDyoRyIOZwh4H4Flj3xgxqUMRpCl5Wp+Hw4SL6Ek
	vVnbWdy4f1PrVmJXsCKpdeSEL1pdD4L2muVj2V7y263Mj6lsHr93Vy9ww3sE5Xavd
X-Gm-Gg: AYBFou0c0CztDadfqEn3c54vF44JxsVzRQTJBWaMViuDjahV3zqenEaxJgSE4cGs2bQ
	pk43CId+6WOW6fydgkQxutbSmD/okEziq+1U/xzUFMMcr3Nm6CfRkq2GZdmPnQv42fI4N6KDD2a
	lQuIuVSHw1L+NzE9SNiDQ9Hlbh0aojayt0O7YMi3C2/fBqar65ytneasvasGCgw9vRnrmY7ZKnL
	5JX6ARi5QbMcwhwIZudPDT7CcqbwSDqk6EiGkxRLxyF4fK2XovRfUE++R94TqNGiDLTo5NW25eJ
	Rxge+Hw8OGUT4P0g4oscktLwwKoGwrPTf4uh0vcy2jsraBfChilN+6lKKY3AaKYg93myBhRXzW1
	7o7fRG1BzUAcX03LmUaVO/RJ0BQ2KC61TUAHg2Ls1leYfsvfyC1Of3T66pQ9vF50xPSZ64GjXt8
	WbAVaVT+xNN+uL9Up5dh95LXeomyHRdYoFnDZJ1DmBA8QQnnHZeRvlVedwT/8=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522657b6e.56.1793616138164;
        Mon, 02 Nov 2026 02:42:18 -0800 (PST)
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5640de57273mr6522644b6e.56.1793616137662;
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:17 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:09 -0800
Subject: [PATCH v24 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261102-kaanapali-camss-v24-1-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: dKxexqP2-oM45h8KJiVw1vkHBzmtjPPO
X-Proofpoint-GUID: dKxexqP2-oM45h8KJiVw1vkHBzmtjPPO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/ahPfTNUJDud
 KKQ5Lky7ccWZmWW+HyKRBsqHXWPX/gOQWkdwCHzYZY/nuUeTAS0Q+KTtKGys8g3iF4PqF/BxC8c
 ytOLziNnj7W66ri4twBPKBbuA8i8QwQ=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8690a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwCsv7kCqXAgY
 wR8nq4yYper/OVWjNj7dM7MnBP4a7NWzQ2GN6xYFdYHDJBFCkqibf+ls4ujeNPb/HxYqAiKHCK+
 Rzw/l0lNfGWo6pIoP+NHU8AyGc3Ivt3OCs5F2hJ9s1m+V4okcdmN7ZtBH+q61H8NscEUv5pOWzB
 699fFYu/HXkxkvSFKhNlLc8q41FxtUo7nqT5H2XTDsmPYqL9olJLKyvYp2W6mHBUzYjsA525Vvl
 sZU263l3YHuG0/Nyzbzd3+q1VTLe8q3N00S+EH/6WqfX1BPAIiicSlVxztyhsAiMy1x1rJVQoZF
 esx9wGUVwWh7qGn6K33k5YidkZERy/7lI22bhVT1tAX7i5YJ92J1I72ErI4+nGku2UDh0rGKoRt
 2FO1WJuWPo5g1jzZ6CIKZehrRedNirYkQsxrpbNsB//1bVocWJ5SDaRLnz6pW0c8HZ6mIC1+ef3
 S06FrXeGEIB0GnXug0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

