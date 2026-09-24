Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33C472783
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246460; cv=none; b=MXMDaI63RWjZj7+yXcoW7dXCr1qtH2oaASnfa/EdSmmfRMGlxzzlrAF+EwiqP8r2uAZ8BTLUK0pSIXUyLnKTI4pNSYkuqJjLcSQWJNYKiXSDXcVi21ATGssLxoldeJoUTJ1nXgMmdPfEjEpXEtUgLfegu1IKp3t0Ql8aDVhz1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246460; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qN+AmiS44bCp5ZAo09aV3cgAISkG9eGb5yrJEidhz6ksXY3A+EpRspszMyJ7DuU7FW6hMBsQkouJ4zGM67IrJ5N5+q0OqtDL/aoEWMMZDerPXILFxOMfG9hn1VgRynUzRlSA4+pomyJc27s/7LlnsBDo25uOPhcAY4C2d3KWmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfJlkB40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NswHOQtf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfJlkB40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NswHOQtf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PM1j2919249
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=gfJlkB405b++OL5N
	op6WolJSASwZhA7khx0c9jVI3MwYSB4FFeiqpxG4RRVc1f18cjtDUS5ljzYRnsBW
	VOVEhgGzMdtceodX3CRBuwCBxm0yppmTjLI/rHUMKsXf4ztDGTXqqaGhrLdAB3/O
	AIa8nlctt+CfYBLWwsQFxQTO+kn/q1RCOvvkXNywIEbspac9V4pFUtx6mNQD2UC6
	tUwOAxB9lXZdeS4XQbY64qV9zfm1GuaXIqOXJ1MDi452NIZxVJHZ+4QnmXjyrlwJ
	8SoUfBzOVwW0stqETVSGH0uAyRS9/jgRnrwvVDrBd38nR0xZ//BsJvAC9eM0HIgB
	CUWJsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-912330dd4dbso13934496d6.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246457; x=1790851257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=NswHOQtf8uac9UgihZYr8vthKStxrBYb0QDv2Jm1IRWfmBeiw4aqdUtMOVQHFjLvft
         ZnBquNLlLiA7QSB5mhXuMbEBXs1KfEQa6Erzd44HHZXhx4o5zEie0eH6UmYA/5ddOl2t
         QzCAvq5mrwWonr6xGtXaYj5tP5Kmxj+R/FKMeLSqH1jlw122jIlAYDczs58Gqm8Jb8RI
         31gD6ouTodV/3AtFlwCpwkSqr446qpH108wbJ/m80z5kH1d70Zcdb/bISzvMqEIT5s27
         lCcWSyTDOIAhArPF8/H0ULZm0jgxzwTa9ehQoFJP8nhfYeKX3UtIJxKMXsi5vnk+Z9TU
         NM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246457; x=1790851257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=cu6J7ed0uzGRjOFtrhsYoqbrlvxqtxAOfS0sNICS4q2RPu3p52mWnqI1JuHtVALf3k
         c3N8XiVsP2MRTLsEQr4mizJ5F8caQhkbZKx8zURjHtmLTXt1dRSiYlfmHfNrywnfLsFw
         0/QDzcb5r0IAppCVMp+HO3XkkYCWh+59xawcyDBB4XOYBmLgf9Ue/72i9ZpEcuuPCget
         Sf7KGYV86fecWdoTUiynhzqZ07ndlFQNkzsnGZcpRDTxmMDjMeROxX9fi4Gy4AxH94Iy
         vIFUiPwxEKe3m6pBjT0xOvl0gmnFJJ30FyRslQoYKwLGSs+tysYelpyvsnjtSaCODuvk
         5flA==
X-Forwarded-Encrypted: i=1; AKwUvByrcwcH3oKpNCoOPGt5Jv5U4NZcrsT6XdANx0+Fci7b6z1J51lkQ22BSPFCMMrDz+c9YvGwFoSjBXWV@vger.kernel.org
X-Gm-Message-State: AFuF++mep5NZuqPYcURprzMEymAj3gsW1DG2gdSBw0kVBuHu+hyAjb7C
	AwotzP+zzX5UF2oq/4o0Ov/ht/nYdQXOOQRDt89Qg9GGjX+TOi0kTyZS1dxywu+BeXInVwMhbeE
	aP79XF/6iE2x89z1zwB8ercKHEVH7ui0hFbJlt3H3SDmprbKq0nUvouRJU9re4c+N
X-Gm-Gg: AYBFou37knPBMxWK/mwKt8zDj/VbMOt/KJFJF3F8vbA1KyKowz/Yhnep2NwykgOBkqt
	MVfgV2P1/BRVsGeecWtzkhRO90zRXnjDs+OVUVXeUagwK8C7akBORsAIxaFLVyI1aV0qwzjrAL8
	qBOsN3Re5OT4Vlrzmz7qFz8fToPyRuYAvS0+qc2uYKuOe8d14KERFHUG0d2s1ik2IGt8wYTvN/X
	sAXMclc2G9j8dRQoDlkwA8iy4kDfn8ifWCqmhMN4SZ7t3elPn0Xcri6HmHEoaUQyhkBMMSvUlJ+
	Gwu7yf3IcW1AESdpqU4KT6rwFYHkX0ru+u9P//AANZ///6RGOAAFpaZ5C+4cmG4/4q+TxIwlkuA
	ASupuNnMn
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207737485a.8.1790246456989;
        Thu, 24 Sep 2026 03:40:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207732285a.8.1790246456397;
        Thu, 24 Sep 2026 03:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:33 +0300
Subject: [PATCH v5 17/42] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-17-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3qwI9XIIYy6eZAKKx1jQOfULxdTshmcpiCV
 29TYHy4G3mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96gAKCRAbX0TJAJUV
 VvzbD/4xw6e9Uo9c0purWmAoVYIptLOFvt++YDlJURkP1uCtjQxzJPvdaRCxuB1eh9yBJWVd5JD
 SgcWHuXoPoju9nTdu4smidfgRtFIKM/Rnfbsp4mTgib59WNANbBSjjb+g8klF0/on39AAWI3iCH
 CqRFLFPcbCfog/mt0O7RDwmNLzUrtcZe3wOp3/JjMJ3AN2fPC9ItmNQIwssAIdGgkG01bF7WHuO
 e3hIWHYxpO6rbuouIPU8wVkmnjZPnEQiOHjVRJuFSRfCnWpohmi+k4fkf82cxsah86m3k3M8mun
 2hsCacZQwhJnAsHQiO9sLvkljYiihjKoRBtDobVMboVAyKHhR6eQi1WuViDJ2VOialwj1Z08Xwg
 SKmbHiHzFiQS+Uj8yh/VchEyUpLWjSqUf5OHMb8TENmtykf2Y85ZbY5ny8PHVJXigmWiATqtbYi
 q8YcX5E0OO/slWeI3uYEyEOwkTpCxmTGq0NdEiarD6pE7F6Klg5zkfjNt6YZWFfKkMWC1QuWh5S
 dlICZ4bcZQWKNZaMx8fykCwsYDfB4pjcov8CTZGxn27QvFigLO83uwYkpFvxTR+jLAqtXAXrlv+
 i8i6kN6APOXIJxTJ5d+mZNLBPQQYXwTsRbcxKbw2tiZRgLDAQH+5oXgZLO4ot4P7qV+sZ7YAmZV
 6L2cX8mY56/LSPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0YTTekkV+NjQ
 5L179g5OxDIgb5FpLC4DpqnCzvn9UDCN2qbL/zkwmBa4bWGdb0weeKskSytBPL5tUoEa5pIpfo9
 zSFoAtsbwOgEtGUFCdT4Gr3YlS2G6Q0=
X-Proofpoint-ORIG-GUID: vvwZb_mGHXAYr2mbSm0BAxeQ4cqAS6Sb
X-Proofpoint-GUID: vvwZb_mGHXAYr2mbSm0BAxeQ4cqAS6Sb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9HM0633QE+R5
 F+u3jt7Wc8aj7GNxD5DY7aDoAN7oYgYnqk+iF5Bv88u2rB7a6UF5yf6ClVEvtUCJYGviY1wsmuH
 jzkI0rIDOXUlJQcEvh+CpM7vC0Vq55+rOFlcQHerTxvsoIWEoJkN2u7Rkcqr3vscvN27y468I6w
 bjbJlvacTxwdhFVNpp6emlsv1FDaxzpxy28mJc5TeXDENRy+6pEHvZ4b3oWRCplgBD2rnm4eyEZ
 /PlQSPd0vttOJ3CXJJUf0SWSMz9T9zLOcjqzdmmtgcp0JLJKY0m7V2biGb2r7Tb8tKdc/WMTLJx
 W4S4T2BD2sjtSDf6XjCBLvk8rY6p2ZA6H1sTVKfWjoSmXymZVGUL6b+1bgQnefrtoWXJmBZJ0ri
 rWo0VnTbW4aCER72lfzQ1c7c+MM+t/AGS0Y+O8rH/8VI+Xdq3Q99SrewQO8KcaSZJFT0+ByFSPY
 XGsg37U3Ft7I97SX0cQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe3a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

