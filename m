Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD455013A0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417297; cv=none; b=j27RLxmTiIRdYBOCvpaDRZZQL80yNM2hdEGyL+8sBAm9hcoRqw3aZ1QMdl4cu4Q3DdsA9UsMKsRUG8+a9w99tG/tpkkFI9tYjgXetV4eqrMuZDAIl/qRjP7JG5kB61la+JneZFCHdPADJD3CA0zmqo5dJS1L+4aCpE9QFnEmxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417297; c=relaxed/simple;
	bh=cBcAd66+zUojXMtMeYHkrCzJtQG1CsxXj9AU/KSoJtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOSiV8AaNGFrGLkjW8dHEw7w3l+M1GMRloMTv+I5zGQd5JMpfdzwhud5EVedV0ZhJs6v8SUnqhvYzmBoCziBlwlwzHkEURV1sS1j1Y+fSpWghWbBTevjVohoBm035iZc5+6Ew3OW7wqTXu4gpou4KLSSyPzrmsZAOvgL5lL6lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzTi40QO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeDqBpUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzTi40QO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeDqBpUv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YgGK2688704
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6xhws4ts1+U5hIU7JMgs+M+XyjdyE4na+UPH4HmwBU=; b=OzTi40QOGlaVbB75
	9OvsoTNxr9aiDgH2SDOuvFixYUNsogQANpwl01MUOowpChYx1MYQylqj7pEGBtK7
	C3xonRoYlOck3B28Kb1yuw5EpS0XOaGyX330VUivoml2Zw9aIH+AU8AIkqnFzBbZ
	++Hufjl99khApBFtrsBJVtTyZr+vT0HhnvI5PjfJc/BkMNSuFHCoQF7Pcmgvh06n
	1ArnGsSkEJeyemr+Aflwk1F1vphKonmooduU4fvTKbgRg3Mwxp5lm1VuiRkWbHwD
	3YOmdjpvic12gVDCqiTXHp68wJqIX7UY9YvaRzV+YnOpPinKERmPxlFtrYHvByQ7
	FGbhuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn156w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so351149385a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417295; x=1793022095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6xhws4ts1+U5hIU7JMgs+M+XyjdyE4na+UPH4HmwBU=;
        b=BeDqBpUvXRUxlBSBtZneIr7CSW2Te4aVybvPEJISl/uRm6Pde/3wC8R7jclMWb+XRK
         rZmanUMlVuMZAz5yE8GLbvUj4U8iZgfQrr9MswqSZVtXiQP+e8sYPVcHXCjcMQ3SvWsX
         bxAFjJYGmASAXS4Df/WaBRChImJUbUcWUGqk8g+5N7ZonCzXSmaqJClF+bHCfPOvkRDn
         avyVCsAtcdAF3aXQnS3u3v6RN59UVKmsBKYEqY6p4EgrIfBv35hgj+v+rvi3yWyal8UF
         p7CQL6saleitxWiFI3F8ykzouql00uZ8rYm6P6AkxkfqW02BGsCtYrOdS5/rzM60j2rr
         iNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417295; x=1793022095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6xhws4ts1+U5hIU7JMgs+M+XyjdyE4na+UPH4HmwBU=;
        b=sihGJuLVk6oOP01sJ6RIqh/FdMq/FGSEFyh7T3htYiWy9dK4T7YcN7vlx0LVQnl6CC
         i6nmvrhXyVh1zH1zkXLH08gvls3OKAeGf1LWv1Y4O0wodZtH9pQJnP7FfLNETRcokii/
         z69nhrc6cGZm2DZUrVZruMN6OH6PjnrjpITslNVOo5le5NPpn2SMDvnnX6AgLxtuHobB
         bSeygKdUL+uoNTuCUqW3juT1g/JqyL990Q6WqYkt8wKf3bmJ27nM1TJ79FZGALaH92o0
         lmfDf6LUXpwwMliPs0myvvLPcgASahCLt0FVqMr4+JTcg04JI5U0BhL7oFhUnj1mYlkG
         H28w==
X-Forwarded-Encrypted: i=1; AKwUvBz3evim/kQQ9ylTuYVuBgs0eS7agOy229q3wZ4J0pwWfiTIVVft7CQS/GH47bZIG5nfk5Gg/lldKa+F@vger.kernel.org
X-Gm-Message-State: AFq9FYL7M02GU996QZqWbzHxmvxwf6K+fnP0vCxtdo2TXv73iZ3KOTKH
	lbzcehsfpUajl3Sj+skt/n9WOF1mlatUO+Q/C/stCXv/aBeTqY5u52UvRcbMbZOGBHAis3xPaU4
	O40cETD1KUkXYieHQC8Xi5Af1f7nAAQnC/zqO0QBWPQtGONsb4ISvDG454+oOInQh
X-Gm-Gg: AYBFou0KhMQbYwxLBw4znevWqI00dBB+Gszgg1kJ//JtAX9GUT/GaTEvJOEIRENK/XE
	XvUQvHwaa4FS5vG2SqKUajZ+sc+/kYHT0cbEsjU0TkInVmV8Y6R9BCZveCGWfdW09YuEdwH47AL
	3ComcVWS1+1me1uE1iICJ7V+8PW/KzysWLNzti3eStFfD+Y9lZYfzoQKcbVd8XaBLjQlkWURK6a
	WPPXXxpna7tjJhVTgqGagTkngRwG6AocxWCA1C+ooJc2XIFVgh75U7UB6MbYl46zQ5OwDteXxhi
	H2bZT+6R5xkIDz/g+I5t0FBzozteEozzdmakBI8V38ciGxPCRLX1SUZNwIv72Zl0zAs59RhdCNi
	aQpnobNhqWAyoH0+oBK4Yjb1z35Q4Wim5gwDpT6nO9CDgzEP1qOpi8oJ4OR59PD7Thya+5se7Mi
	7VLLbEV/KbBDDB
X-Received: by 2002:a05:620a:8812:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-93f29b74538mr1213519785a.6.1792417294575;
        Mon, 19 Oct 2026 06:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:8812:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-93f29b74538mr1213514885a.6.1792417294040;
        Mon, 19 Oct 2026 06:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:09 +0300
Subject: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cBcAd66+zUojXMtMeYHkrCzJtQG1CsxXj9AU/KSoJtc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h30AiXDZR4XQMypLd7r3RjKWQqqJ5aN8iKPs
 EYBH2hJZISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd9AAKCRCLPIo+Aiko
 1b/xB/93vhtvbcoL/GIC9eIa8KqM7a+E8NpX3CmCyetRbf/dzyhbh7xnjf6Q81Bh8FoOvlepzZb
 H0BzSbj2+5vFL3TLLDAxbJE6Fv9J+i3KX12aKs8Gk3uIowneH77DtNCPsSkHU37V0U6Ozj4Yp2r
 IWLCfjj+64VOKJHOpVjMIjptiwlHE/AdZWVwDqcYwdtHbq0VU2MpNPxQHxObubTsOOGe/tvij+f
 cKD9WuZPptIN2QeCmWgpnUflAUQlOCcuHQAGl9LAA1N1Zt9aUjOYIi9ndzvqEYMETdqaFpBhAKv
 yFIvyPYstVVX6yu0BZHj0w+W4/WVoxjtiSIjU36cMyCNwfmo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX88Pz0yUuPXVH
 +4FOkakpr3aK95EerRsmSB2SrP4V9Tlz65nzTkf7KtPIEKXWtnDhnqaVzVx7CwMZcJSJ/cIJwgZ
 1Ev8XgBX5/7ZsKQcQcOVyhsCE8r0HlE=
X-Proofpoint-GUID: 9S2ZbB95PUt3IcLFy99qcvY_ZEN6AG5f
X-Proofpoint-ORIG-GUID: 9S2ZbB95PUt3IcLFy99qcvY_ZEN6AG5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX2eV56rZtrwAR
 yH4C+jzjx+jBVvLrFiMsEveaMAThBJzMfLAvbF5zyJtsiwUoEZ5c+861/nMdsOYQK4wxmWUnFoa
 KcTb+jJMfCanDnBnYIe9NTmO835HCPtYYoDL75A8ZuQzURweBHOhcQGCJYiw+jjD7QwsjbwBWRg
 aZkjl7CoNjxlF2CdTRVvK3q/01Yspc5wud23cg+leJB4dVRDiK3DZXGE59bXBH69m4i9IW7M4Zi
 VX0k4HFJ31Z85JWPql6xk9lSTpD/Bb5mvU4Ks29AInyps0Uh1DjZjTsq/dFcaZnZ0pJElyYOpD/
 KY6dRkUw8CSo9BWQaQMRN1/xfOnvZ7hcTZ8+r9haxXhJ2Ml8rXIX22VV39We8+lu7r1vtBJcFUv
 e6rVnWlWpyR1KB8U44l6a15HxYdh65GtUyeQ2xNF5Qze1HpKdEN8n32SLoYPJt0MkIMWDcLEnGr
 RueIZBH2hcJ6v0WEgDQ==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad61e0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Y8oF2I3fsCxNQvYoXK0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

The CPU clock controller of MSM8996 Pro needs its own setup, which the
driver can only apply when the DT tells it the SoC is the Pro one.

Use the MSM8996 Pro compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996pro.dtsi b/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
index b74cff06f300..60e2d4270f08 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
@@ -340,3 +340,7 @@ opp-560000000 {
 &cbf {
 	compatible = "qcom,msm8996pro-cbf";
 };
+
+&kryocc {
+	compatible = "qcom,msm8996pro-apcc", "qcom,msm8996-apcc";
+};

-- 
2.47.3

