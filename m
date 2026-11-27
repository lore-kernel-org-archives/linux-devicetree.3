Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779712;
	b=jB4roS/TXegvcFtzrHYgecKj9E924inurbuHTKUEhOsCd+7yZtJPfRi4ItQEVQYPOJtT
	 szFRLE7BK41Gc9SfB0Mm4Jr0U42nyKO9ZGCc3NQKwpTD3fEzg2L+Zdt3vSmkUjyO5XrFo
	 60ofytVBitSxn5q/rWs2G5LjrLmUlHkyQANiqT0DYJnmn3MUeLt+HxVSvnX/kc7A77NCL
	 uz2aKxJXt+c1DWeH6G/PAtHNiBf1FbP9ETz5LKx4G9/uHRvOcpGPw0p1DTPwaak6UzQxE
	 DI6RBmcBnYVRiG1kh0nZQkHYmywPKAPAtOhAfu5w6R4ayz4ZFHvSu0Mhj1xXUTJtd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
	b=BR71/gfP3Oq2I85LxEs2jK1AWIdqsLx9w5d2WX9K7DsL94gAuA1ZewYS5WQv+b1SX9Gv
	 Y/lWChH2//tCSCdObqZN3UJ8c4KkI50zNYT08ZS0B+IB2T3Hu77jWMDa0Y9B8PZ4xini+
	 u/KrayV78ZNrqUvYjKndzH1VNLppEU6PWoZk7lGuM+CYk55CoyO8EbTrCk9jHGuwX6yZB
	 6md/H8qxJdlJKjiENhr75JPU5BJliEeKBbKbZzEcQT7Fv7YUO63Ob3T3sBHQqhsQoEDus
	 J4FNl2yPwLU2FYb3lx1TxAaWDMVj7/i/H2aAJmJHSUVsjhJAAvQNhAxA9UDd8PPHAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CS/jqBxP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4C60A3807
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E4C60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CS/jqBxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApA7L2906439
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=; b=CS/jqBxPR0FxFoC5
	pSPSKZ7d50UrShxfvjlymocXvhUnD+pa+IyRau0O2dnJhmov2uqCI/x21obm3L68
	dXlxEyBZgFCkJHOkb81Er3eMwscd39QjMl/WsnVTADbbnM5nktWNLi/6rxWBksF6
	K1n6QiC3LGU9Vh1/AtQI8n9/Zyukw2p66xX7UoUUDtefOk5UVdUOXEo1T7AWcDoG
	3DpsvBjw7f+qyNbOdQXFa0xmm985I/GwqbdyG40tIo7QodIxrVS1rdAsQF3iX6z9
	fVNFRmIoe0Np2TV1UjIGyDP5DbsujRtHVDszDPilKPQ84/IMHOpFLob9VAWj5TxK
	prjQPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93b1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d3232fso1098682185a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779709; x=1796384509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=dHvjvmiZYv9B5t7RlYFoph8sG+U2l+9Xu7W4kyZdF4CfPFbvMv3WY72vLTE/uvicRW
         Zd5Jt/fvgbCWlHg6ldGNdBnvHe8VHO4sty12lbOgO98a6lAIRGrbFaJppS1agYyP9TXs
         vACuosmc0+A9/xjkgzwS/R7MlONqdFwI/ydPIcqWbnbFBVisdcRGaYGDmvnSJ9fZLekc
         Km07xGfGS60ucqHKJyzX7qUm7o69wteUcOlRGhEz19zF5DRtQOQpxzcNOH8lhoBL0fk1
         wKO7mIPrE2HyLyV8Wh8HuCj8qcZHsszV8fKm1C4xWRM18nEbtzrPUCZLLrgjfEI5Nyxz
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779709; x=1796384509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=QBzW3vpfVpOjBzsQkJjLPh6DlxR7MW7f17QmB6MZD6sx3Ar98xxcawwCqaq+5mnDHb
         NWa9/QXyvyTCkD4GPj/tYh2TXgGgG7M9WFXiBv/NSp3mBpku0/SLSSzpLaM5e/inqmuR
         CHoY8Bb45zmUCRgaM6BXe78jw5Dv3+4M79b9yPQZWIbaPdxzHVRClJ/YMjqL3masGdHb
         V8CmVN0alqOM3GHs7aTRg3BNtY1EtnRXYIZKkBzOm4v4bSkLL/A+eyDbTuJ89eqZZSjS
         rQSjYtFSKWSOI0EiQdwista0WLny5/uW30ZFsRuDZcJcJFuzxnNUfPbAQqckpmwtM3OK
         sfCQ==
X-Forwarded-Encrypted: i=1; AL+hErGqayzcQcl/n8xPhx5lxJHelUNUz7ML9fNDjkvWPUBClY4Vmj3raKkSNnyZY9Nu5kZIU0Pfors/IP94@vger.kernel.org
X-Gm-Message-State: APuU4Z+flPBjp+fN3EB6VpXZWIFNC3GftKb8avikLUVCB5XnbMRtu3FY
	hifmJ9s0BkWq+j6zM5LNWaR1asg0RJ+ZVToc97mx6GAAKEnd7thKok3EqZ+V7dzOtOPBBPG1w0Y
	WEAH5ISgl+j3tgqpFQXWhx3CGfCzS1pJemnEb7GQa+p1ST8XoegCeT7S5MgYHT2aV
X-Gm-Gg: AZFdTZc0iGyCyvw1jjlMaC5OWnjHMWvrqtJNqtE7gMp4KlFTBG/Yy0KcjLp9xsdMVsI
	GXF8vW2JF292/dNHXgnY3KhCFAuwXqK74ki844Ft8x/ADfVnVFm5g7o0UVIStwTFrZEAbdCVQVF
	73SpjKwpjBBxA3haOxQF5BTHxIP42XT6+GDCm0JUUK+4C7CT0nxcjf/9wELT01VmMio29rQpg52
	L9U4MV3uRJJhQAY+AN2ULfu120wpij9cHNw1/56RpO0c6KtCeg9aPndIoLxINIf+BIZwu6mhf00
	8kBADfvCdNjoyWjH5YD5cqvVyAXCHckKQT/wQuxU9jtw3O7NGFOTUDROR8FytqZnaV1GPhlmuE+
	Ve2i1R4bFcCpU0f34NJwdt2Lb4EsrxWtEQ0WcoT/bpVgsaliCO2OG7MSRfmgnVfACOWjxSyStbH
	rE42eL14HMaXH5KqZQZ4JDKIIu+vXGtWpK02/KcyRKJPzqORm9SKoTw3fI8j7ERnM=
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972939185a.37.1795779709393;
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972933485a.37.1795779708887;
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:34 +0100
Subject: [PATCH 5/6] dt-bindings: clock: qcom,rpmhcc: document the RPMh
 clock controller on Seca
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
Message-Id: <20261127-seca-clocks-v1-5-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cOfO/lwWerFvv74BYZiZtxxqDUTbGn52r0I0TAxffcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwBpxDUHhMVQG+XeyCyeGNmDrCcfzYqwi6e
 DpBPvYCm2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w2KcD/92QSfcPtkyYV8dMMTsSDHNtwx6X0n3t6nE2MpvWc2C5UyR+UXpYeCgF73fQLwau1i1gKK
 t3KKEktkj5UkGynbnum+KKn5Al+ti20lgtrrh9s3Y+QnjAE/8OXEyakvVz3nJy46jvgX2nOotLs
 Nc3YdFd3CCsqTASrWaFlwKDoTlwnVdGD6X6uVIoblo83O2n0F3fsoSYksRHr5Zp0+czHBWTkZlM
 Q7RZxL/0nOAb2cEexn5vU/RXJnRYgvZANTPE1CbaH/Al0YS1UYJdFlV+pzv/9QLEc2tjAZT/wWL
 1/D2tWj1Sok0S/t7QM0dvNwnl/osFIL5kmp5kXG7jG16RWPPtfJp4yXh5FzwSC2EHY5ChsQom8c
 7WC6eEIiynYkOPBCRDfdJLCCVccv4RAHrll7P3eynqvC52KUXeJ4Up/mmacY7J6SQ6Ts+Isz1Qf
 AwyBt42FSu1I93fmU4FjD4qz3+WDoXPxza4jqNz5pcWwwGiY6mFomVdlLcjD5dtijRq0cXxPHVk
 N8NiG2S8DBkNrgCMjGwMWdZDeqD0jUg4DTBHTZn/GBtm/5gHTf1t5TA3AP9mS8x02xNIgdUnugm
 pcoCy987Hj3CE1UgEr5MAhyZ5UCrj1EueNKdWolAyR+EXRTcKtQvP+qEN75OpvQqe7HXfs2wvCM
 dyKoQJYDW/uZBGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YEBIuvPY2sxvR9gKoJxUVbx4yOl2lRLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXwh5Rod4oDtqd
 z9r/Wmq7U+IO/YEhD6W0qW8OuJYSbaY44N2fQrPydOhVo6PsqlrMns1RNs1KCRpnRI87/y3nFdf
 /03bkp6JDtm9QNKRIWcXP7/GATypYAfAJU79J42n7smJ70nqiUPyQHHdjVYwj839xDNdPEQZcH/
 iJj7+NwnU0SHB+temMKUTuxy+4qq8qIy4CBwb59pbulZmwBtr+s3GiiiMGn106jaM25srF0XKY4
 W4/SzI4elhrLdc0WuId/d9ze5ky7Bub0EgOVk0vFRX8fwjyBJUxNHP7KACxrvUlQctRgbJuBJB1
 2howjC/hy89zAthf/IAfbzwiwU0Sf0cpCk2E0qoEDb+6yF0f5IKTxOSV+gi/bP8zLmBwxKOpqW5
 iz9T+CgmTZweae5YvFRILSY/ENo8crGjF2x6Qlt3jwaBDlt1OBZMEOIRNhPyULvdTNNsudW6Yfb
 dsOOFfciTaIlGpa0Z6A==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b096c7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2pdyNXWkZcuE2R3gGgkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX3UgKq4QWfVSp
 3i2sM2E+L4TXqi6AFTPcC8mo2VRYYbvc37C8+u+AX1oBNIcW6SZDentfsjXAj0ftYFz9845UHu1
 Fn+sdVZ0hIatoh3zE3RT1xpGH1imm4o=
X-Proofpoint-GUID: YEBIuvPY2sxvR9gKoJxUVbx4yOl2lRLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the compatible for the RPMh clock controller on Qualcomm Seca SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa59ea85582d5bfd9aef5c48ec6903..cfa78198b2c0cca85888303b25766b7b01e2c13e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx55-rpmh-clk
           - qcom,sdx65-rpmh-clk
           - qcom,sdx75-rpmh-clk
+          - qcom,seca-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
           - qcom,sm7250-rpmh-clk

-- 
2.47.3

