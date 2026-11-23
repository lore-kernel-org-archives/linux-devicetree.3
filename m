Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467385;
	b=VjMIxS6sMlDY7qXMvJnWIpgBgwN8jlZLeLJVqozZ/zLyinDlVv4qFehNzwq73Y6LEu5g
	 TJXqd4BspKyErb8WR/FsbsWzrHCauWiIG9k/G3HqtIGXA2co3q1NVjBeG43pmDEPc6PSe
	 TcbIGrALJH5Ip4pj2XOh0x/64Y18ELxOgDq0tPRXb/46cCjLI/h2JxOz1pAWq327nCuh5
	 sjRGUFRer2pi1Vn4Zws5ELltgFgoqQ7mQCOfJWbjlt3t9fQwLC0u1JZgfhgK1gx2AkRkR
	 6SyGwPnU3ikvBG2FtXU+RTbA1EjZIaynZOuwE348tjW6xS7HEv9+J6RkJVhRQwvSrYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
	b=bIXoiDz4r6skGQrMojBQLUxXottOtlMgtGfgT3HkJ7snKZHF6pXqfZMfsbIqyL7KSuEv
	 n87rKkBY5pITR5P8Bb/CtxSag8ewH39Y93j/JPXi1X+edfCif2OulT79aN+dNyH4i/7vV
	 XvTWCuWUbBSgmq3NaFkY5LYOYCbcG8zExB9tESzSrDprG1g45U8Anh4sHmcvPGX5vTZYb
	 oD8gq7lJ2ZLIERNMTPU1h+DqZF16t5wJhZhtLekLfvAb8/nvTeX6/2VbPpIbmsB8086h+
	 tPV0YhVMGhZfIzMLJYfOCSKlXoLtzY0LXxbrrnVyROSVLgWV1NFlJp+wQNlp2qfTHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424E2606A32D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuXVd1332752
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=H2z0940Br/B6IYM5
	v050grSbNasErG8gRzb/FuLQCmYqwrHcY7TL6CmETJ3DOvBxKlip3EH3Qqqd4Xmi
	waVlwJpkhabehJ00n0ZtXV+qS5WtOjhWhF/MaR6ySBkRI3aLCmvHo6pKJNtsieqL
	e/2it7vqG5XlXdyboJ8N9rmvxMxFoFkKMRgR7bk73Z36d0TpHMALUCD7syoZZO96
	L69IQ6SpldT5XSP0828uLmaNCwpsp4bQODJcCAc7vm0ZZ9wKvJES7qbp/8fTQmY8
	tew7zVMnodslqlb+AFcCaWEKATXT3yDcWf0CUA3ChfhBD8wHuscNSM8Gk8ZkFnpL
	HIEk4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743exb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so2157689eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467383; x=1796072183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=Olu07rpeqo3Hu1bcDlZO9+luO8T2OwFWlh2HzFjcEkHEloz3QFb34g8OUJVvKzR1tN
         3bG1b2qsESxtHGiKS0wVjiO5La1l0TYrtgZyIHkRwagSipoRGI9Mmtcz2ngfdKO2Gg3U
         85yhqeR4JN557Ueq8vX1wgCNmxeNbrFP0/RJNr2g+YTHZxFu+IxKoWVX/6SUAn4W0DaD
         CYXskwS95nTLLPdHZjLfSWK2wxUEK11pGdzzgCbXBA9ozEMwMpvVPbotJkrl/x6kB+Nl
         J/o1+T/Uy79oU9pL0h/vQ4vkxd0TMMoxoNc6VwRQ/blo97/YCxfs890mJB3cLQLieeJR
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467383; x=1796072183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=P+1/VyVqec2So8Sy58wXr2t+0wmbTqhtGL0IO1RTJZPM91WPWLl5+EA9dXDFIFWjyN
         4jfwxqZ7F8k6OAjeaytuMcCG7rT99tdXZcQZRWaYBCHy4Mx/xJNSkPC75YjMnp3kTPb1
         2JAphEEmm21toME/ossjfpXJXUPPeKuqXnpyz1ebDybbKLM3egPtqDuQdt9dqY4Hu/4O
         yIBLvW7kKKodT3zc5BV8joEuCJXksJQFshelWrZ1/5jtdsG1hLo8t3p9NlbmqAFsPyf8
         Y1F1FP7zOPCoaZX7ZWC9A7P8IWWWDn5g3hrC3YvWIo9vdMk9Tp2JsMw1vFFp6Y/oEWPc
         6LOg==
X-Forwarded-Encrypted: i=1; AL+hErG84NpRAvRkcg6SSSHiOrvL1GwnDoJtDshhzlSvsvVZIHGyuYs5ee5s8abZKBOrnf1a2i1gn/zZwyue@vger.kernel.org
X-Gm-Message-State: APuU4Z/DJ8xoICVSnhMWeCRTAUgVjkWXbe1rvAzBw7Uq54ZEWU8bJUAA
	Jsga3qZGp9s67umPZknERn/uvqJ3cDW0QQB4P/L8ZZU8T+JXAttzIHbh5KkVPX1B7kIk9bciGow
	q3SUFKqzCZCV+9zxruknEMyvRyRW++uHj2Wp+8m6UE8Cv9mG+GHQiVhxXEYokvVYW
X-Gm-Gg: AZFdTZfxQ/e+c/rvk0dmmAiOeQIQHfTgM96Rv7bMopOsUB7FJSRZW3H/YhQS7+esaqv
	kd9aAk4P1vBvIWwPzUyeVaQRuyP/jVZygKSCld2G6Ub7Es/OLPAbU2+BtCgalRblPRdmMxlD4aC
	Q1vVBYNzEwmUXXD9fEsJQH95fSwZGr80BoWXuLdhM0kIpyakpw1u+9yCJbfz2RZttHm7J5LkHu3
	b2WngETdr+i6g+nT0EAk7sdKPMVaizEgW3fvNolNdP6sw3PuLIcALo/lbFnnoqsmsV1564dLVb7
	rwvuqqDqaTxhg4Q0975lCXD+CIUH1I6AqciI6xU9RUqtQ31CjL5Rae87ROlLFFN6xXSH4ndo8Z5
	A608F7XTvki7XRj3gQlZwogjpc7zlVkheuU1anetvZuJ3dU6KV8x6nZkBaFSJUR/iIFCEAos/uI
	f0cunpF+Ou
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818075eec.19.1795467383420;
        Mon, 23 Nov 2026 12:56:23 -0800 (PST)
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818038eec.19.1795467382818;
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:52 +0530
Subject: [PATCH v5 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-12-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=c1lfg4TaQF9XXCtiV+bWHYb+IQQy3xyZxsYuABAYVnTRz7kwnthdKHQVzbWpLFWVTQ0yUfG/o
 wCE+6d7SD4uDvya0APz5YCTuTN4NDHptzSZdB82hrfdPR3sFiuqSBT7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: ZWMIXcwIzraJZwbGwpbGMTdSggzlBOtc
X-Proofpoint-ORIG-GUID: ZWMIXcwIzraJZwbGwpbGMTdSggzlBOtc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyVwBMx/ZF2Y3
 RJdEbsLUHmBzZ7W+ORbrnFLBapYregm4fqj74i2BTiZwON6G1yaPBSZ8RDx2uxi1V34JgG5OuZC
 UBXqWCBbnszTgInyBxYNtmLBMePfCb4=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04a878 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/k6z9n3rzdmr
 N8dNvE9iAZqG755afBUWQuxdI3xpO1ip/U24rv3wpB3FLOzauuFLRuXPVOcT3fTZ8Q8ar+3zuy0
 vmFFCX/6TPOwseA3JC1eVgF+twy7ARRC7L0J/0HJ+Gg7dCBaYpdOxaR7c0nE2qpLWSlMu43+RfL
 ej3Yg71fc6XXAIkcMFlLgOfJcKxuXvGcQgcPZHcjMmBeySvHOLLgRZxvpVvWFBh3wB+7mKjhtue
 UeNZffbdLuw8MnFUIleC+CjS8BnosSNI1M1UD5202xSSfkUhxMRZ2xAIVBw9hu5xS+eJtEL8o+W
 mwvohvOnWvzmSH/olyYPKegWiTt4t+2DpRx9yLk8+nXsFdjJ6V2v2oMZOHTYoEYQwZqV3FGV7Xa
 znduFnPg/XBMfNLN3JnyIKnlAhh/HF16dgVSQTPGPJACNfVdpUbZSTp9RPuBnkcuB9l7uoUT+9F
 jMLVksTSRDejdzpKRcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

