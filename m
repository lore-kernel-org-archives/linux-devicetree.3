Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4A4825B6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390161; cv=none; b=ZKK1g7ZAe/S33V+I9lbM6bMCf0rypYvCXj7S58uwTULYd/wOBzcre/P17hKb4iSwdwvOCR0aslLe71Epu1kyHqXGRCMgpB4ugqciiJ36nFT3RS3DJQ+QHqeRhmCbrecUDJl6NswZpcF+oKznOE/vhWjikK4fkoshaX4yFHpovhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390161; c=relaxed/simple;
	bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+cUvPgmafm82uF+5Gw9ktroe2pwXPZwVPr3ALT3H7673GI4jB5BSqelLdb0i+oGxJOp33+hCQlArctJzKfHzybm4V7/Q4sZ1h9oZ8KqecIQ8vDyQ7t03GHCrHTNM5esTy3/H2zRhTPSJ1Q+qVsLk/292JRcC3jzuNQ4W7SxZ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMWn31hC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQY738eI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMWn31hC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQY738eI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNALw431301
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=; b=fMWn31hCpSUnsH5i
	bxHwCz+YV6bscRjrv2nvP44q1AQtrPgTJP3QW4Y1zsx/DCX7YgFzBlAbZk78j2mC
	2tfWYWpxgUxBEMatzm6Dsbgx3NR1VYMWEC/5UcUDMHIiFsj5YF0MCEQWZWNLqYPN
	RdLsUQh25ZWpZLzc8bxgs3lZ43m9muWLjewiEGs1E9ZR730qFpV7/am/lb5SDFEY
	TEIs3GoasnQvHbd0M5q6NZrHtfeQDlxBcq/Uj/hwd76KLVpDRYVKhtAemrF6ACEB
	2HSNVnRVYk0gDAACs/n6UIivSgIn+xqsOA/y8ZihjZOYxF1uVEFIOL6BXo35D6VR
	R+CfOQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-982a39e0c4dso412201241.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390157; x=1789994957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=aQY738eIE0WCbtArsyfOi7moCEOE6VZSdfbMwJm4Fb7lV9ihOSRpANLWMto9k5AX8P
         hOVyDJchdu8ltI+hMUx2mesd/5VmPpkY8tZNV6mnMq6fpMd3pOxP/xy+POCrT2meGmkk
         GqQiPqb5hC6MA6kfWBdyVZ817Hu3K4rxpjHfsuITt2Uw5ojJ+nyzv9LF+WGXM0FU5C0n
         loOSt5qKV2uA0e0byzP4a1vdIohOIVdWzbwk2wEimiVVbmQcCNcBg39zPDHGvkPh329C
         /sp+sQ6VLlhyczWdww1aZerKFlSSaeQCLdMilR3hHFxHTwBGfBwSJlZ1cl60vXLKXsDH
         4ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390157; x=1789994957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=gJ2G0G2qN5bSw/y8mKAUjb3ntEIVEASwr4pRlDwdwZSUys3c3CoFDKHxWxkRqyg5IP
         cbP64FpEtZOf8pwal2WaGGUaYMPdiw177zLztKVp/koj8OnllANWCcREa8Q1J3GPycoL
         LLcIm46pQGOa1NJcQKmWb5GmEpVAN4YfCDJDaz0kjoVlgkkXuNHrqgcDSaOWqjWf0h5S
         kAdfHGH69tOO90kZQER04kddd0m6aPUU3CofbDfGWwsdT4uvlzKQYXEc0PLAXTJfbmS8
         /DdT9K1DsWjPAm62TtNguVLvqiZ0QdfCeYV/QjuBTEHYC2/gbkY+EzjV5EtfBKFBgfP8
         UjBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPF8siCPayRMP6jspkL73YNLFfqkM6AVhIhbVvwlm3ODgp+5Zy6vBEmkbpgYky0anjRQaTbrr1cJhY@vger.kernel.org
X-Gm-Message-State: AFuF++ll+f9sleZVWZ1na3UOc1m6QEPpIDXybNw4OJLy52jcW/P1DueH
	DFiToU7/njcvZZ00Ra1dp6zZukDBEoRd3L+VKCIeC+QS4msv9hsuh9QdGWKK5j5VCi1M0+VlXqT
	yBrZatnq9pqT2VVF/4zc49vDdSrOffBcKxgV060uRkzQknvr0EeKKKKpdUIa1G6ry
X-Gm-Gg: AYBFou3hXSRVXgiYGagFGYsNOnHDvw+k/9JgxSe2Nz6ulideLH2oeQCy9221BYoNchz
	II60IQ8ycPPd7ESsdN85fdO7rL3EjWUQim1UY4tOIJiDwp5oIrbUtUYkFoqPuBGOVbSaKnhpeM5
	S/k4of1mvttAZBKEF0HbGanRzL+Ysl4QkCW+/qEG+E97znUEQeviAcLvldMEkyXKT0//M4Hq7MZ
	zeUooBhDpMz8yOAb0ZSvh0465Tz1R4y9kS6v39F08wtkQjOs5SzQKYp9AOVzJboyPrV76Ynv1t1
	aSUAWg1limiKeQp0Tbm/F5Lv2qMvAUIaf9WeNd6hKWPRzy4dlUI6jPa+DuvKDvYiN1N5jQPGhNt
	9vQBfpAED
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218353137.0.1789390157093;
        Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218322137.0.1789390156642;
        Mon, 14 Sep 2026 05:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:27 +0300
Subject: [PATCH v4 28/52] clk: qcom: gcc-sm6350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-28-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zmdoOi51O8okuIYyqfMOQiCfHiJU6iU1Ivi
 dwCG78PAuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5gAKCRAbX0TJAJUV
 Vh8RD/kBIhVFpnHiU6Tfj5QoN0vxuI6QouwqxL8huQOYIJbNIOYWNLTiAq6gV549erFRGOK+6od
 xMVBzlBiuTM4qA0wXyMjazIHUIn+dJ+F2DWva8AfKaivPiiVEWv2xeM9zVI2HAjEa4rpB7ygruo
 21X/qT+UOpKekbwnZdF4RQOVsF16C9cVaYQH9txZkeu+dD8svW5nUNqZf932pdFs9PzRQf34Txa
 eoaGWvvvbxLJt/OnKQyH/r0EBAwWf6vwnQ+od/eyC5GWw/mKo6GRY9LdtOleERMuCu9twQ5mIKs
 q9w8REMEmesF7RFutCAofhLjzTpCGWihSEcvu1+ALX0jweA8LEe84t8jG4GHJBAJztHd3T6Mwgr
 rGQWAEfirFgBMB/9wRq3vup5JuqRfaFbQTVYQdTa2/fYcdtDCPTRANqaU6klGWPwpGHDuzMM+AC
 +Zmhit+HDf7C087DMN0fyqdJBOGKPG2Pg3DPAyZXioykKPkGW3/lJHc8YRLIjBCRpjw704sl7X0
 kGug1UdGDg0rZBnhg8SlMM66OgqgElYyC0bhcBRkERkad71WE2UpNngYEHU+h7R1U34cmCfYE9i
 iH255WG22QgCvtdeJQcQ3n1n6k2qBsJKZ7/hKoAVlthlKzBsi+4/LNvNw+gtrQ1vUoxygEyguJj
 FTJx7INlMmAVAeg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed4d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX9ZWC/bM/wLnw
 rbVxrjl4MqHDvlnEuWsch68ZVhTmfJbcq38L1JZ8m1G8aDWxFimCxQMBrAZ7Jor1G0VtUwyNNSP
 5XVLA2zx+RbOJLhZ6sGR5XeagXYlASMQ8cpfoplfiEWfN2Ku8f7DABd40/vZowpxQBKp7hforb5
 BFPMlpcY+qlcg39PqgAofB3UksZAP6UaXn+GHiLsO+7STnWZQn8nKxzeh76tG4hMsuQSW19Z5B/
 ehmPsT4MO6sY+bDeEpVqpY0r+fDHX/ryM+gCcj5BEroZWyI92Rz75a8Nl5SBqszxTh6kPt2Demr
 IBZMsUtXrTUpmnSWQ40tBdiXvEBoA76hzPT7F4pcZ+IFb6NiitThSbHJkwHvRYlN1H37urYK3hl
 9hA/S4R9cif0PcP+Ydrj40y0Nol4vQoA9fMfleMx8abXQ6cUxyzXollp3B/J6C6nIAf8VwXft+E
 YFWgXComQwgG3r0fcCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX4/ME+DPMANGZ
 MzBN1gk6nFP3Mi7eHBVfw7JfHgwXL0xuukyYrvdXk2uhMieHT87sJiW/s2YK6oDE5MMwbf7ZgTx
 RspINGdlefsb0UXHp5iqrJ/Ajfr1eN8=
X-Proofpoint-ORIG-GUID: T4IWNGv39I4sHZJIGmkPRcCUI1DG0Tkw
X-Proofpoint-GUID: T4IWNGv39I4sHZJIGmkPRcCUI1DG0Tkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7..b99a5bc53048 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
 	.gdscs = gcc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm6350_match_table[] = {

-- 
2.54.0

