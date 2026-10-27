Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124529;
	b=XkdH748sV3FdIy0NO/sapOMycEUnT/O0OsDSXBGbC7nfErFDcV8rvsHaQZB54W+XnkbD
	 zxo7tEapbFWgyO5I5tEGVGxPZClX4qETCGYY8F66q0TWP1KvmIQD4kCfrl16+oAU8IoS7
	 5SSBaGcU6SjhXTr4WDShZT2iu32UI5qet1gSgU7Vwd7IkOXZ4qdgJCpt6tdvRlkrlnor5
	 qebnaDsGYEfTO1ss4YHUu4Pdb0i/Swq+34y4+zUV+rw09taNJ8+xe5F907dPEXKouC9hV
	 N5nzJSTMwUfGN903AYN6dMaN+iztuLjMraYXZWGeVkgxNR+ybRa5BfjJZ2JWXvGOaqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
	b=xNLdjuiF2bvEgexXnMo5i9GB2J7nKSGVOddHjvmfP/qZ8YlulluiLUi8QLqfshzYwYde
	 WC2grmPb0QGkQi+l+0rcMFRANtm0JB/Sa5uKl931DXI4T+4y/9QcabGf9mEzjLeXAullV
	 gK1/YC/eDt0na99Zod17FWqdEbe3BVJ+w6UZSmKbQ6b9SxJpkd4vKmWiO51aeJdaPWQVs
	 rVwFORBZE4M2eHp/Th47p0aUAyJ/zMO50XXKQq868JtyzuJkLVI6RpM0N3qlqG/vHsGR7
	 lZZbBTbKjRw/VoLJo4Gwto5y8CjMLT3eT5zEBQuy4yLF6Mu6gkNByQM8F45XDzsFx0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83020606A32A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83020606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWq9MGrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5ItdqCO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH03U72772805
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=; b=MWq9MGrGHekRKODJ
	mzxuqkcgIkzutQUFtO3uw3hWZy5Utu+wADC90/n5qK5ydh7iQczljCYwGVwzZrQr
	G7FCLT4Y/vZqiPWOMlB9hGxwZ/ih8jB5j7TFU5k0jICg9yYtPnu3LJ2kspGQpev4
	wd2TYiWNfzVzDwXVeLySY3QA66DgjtED9tfcETTqZB3BvIBVGYkJ3bVyVhfnAY3+
	/v5BUymfcTvBHzaOG/Bf2daRDB8Mp+AICLxreyvKhtMjBn9H02YCxNYhvUWBCTpM
	6vU2ypOXNazANZ+ZDrBeTA4o0arhOnQyzxZu8khpjLNCw/VqQIoQZ5m6zLOFFiYQ
	sak3hw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6accq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:08:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so214970c88.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124525; x=1793729325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=D5ItdqCOtKE0ryGGQAT3M20htsDuAKVnmOZvodn1iCbY97UkNVtAzmwZrM8oFH9Rx7
         j8Ei17sr2u4wqEmdYgmg1sG1fy0uAqYwApD/0bZIVCApu0nwJCEPxyUy6p+M6ZpBoBi8
         /UNpWq2yjUNm385lGdh78ZylSO/6QENpSOodCprdnlUrtyEzfFXfqma/NpA+A5hwqgEA
         DTIGDUHvC9GW+XIShjVGi3yV//H6B+KSKoy7DxFmTyysb3epOc/i5PWud0+++NWfc0nj
         FmgHHFopEumuYLJ5NNuCHsw2C9rlzahSuZ6VRHtClgmXHTTLc4XNDCrERKhkS+C2AmAw
         qTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124525; x=1793729325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+0MkK9FJIevEfjdwnmobeNwbUyoiVJQ85WTwnR/ZB4=;
        b=s/npx8L8A7h5+v3es2cYSelgyQnNJac8sLODxmTeXvBMmOkyKNDftEzuSfe0fb9H1k
         V0wHyr16F4U7bd/XxzvOAE6/xNGm/LBCnzqzzqgSkqXPxtyD/G97F4tD8YNgd7gPpTio
         oESLmlZOpAoX2BWuRYa8vz9rOvzq9F4KAtLGZjI1qhe84XLTzIi8JR3fRFO4PWm4gZiY
         hpsdKqzVnVKgwTDwH5/t1D2/wxieLFyIiwndtTLCKstyN/1IGbRc7TCWlA8tQwBxQseo
         sXzbnNI7IpAcYb3V0Qw0WGgrOn7O0vAM3sdtE4DjG8tffiFhntVM7XGBj4ZbDm+ROx+L
         80+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoliKThal8SufVuNDcF7SWuBQjcA4RMlT5Ru7VZ5FkP+DfmGZFVFFsD9o2OVtDRTfLUIyUjGEOvoFM@vger.kernel.org
X-Gm-Message-State: AFq9FYIgBtypUcuKt4Kg6nvj0FGUsSkktq7NnVkPQNWR4/LuUxH1U6Nz
	eurNbEO6u+5Gkn3FWpTDsDUjMz8vK0b6aJssU37YRVAKkMnMSoBwZt4pXd26L75GMm+VWIsGtSh
	311Sj1bmbA5DiLPNOiRQ/F95bPwJd7ZsGyAnsHu0yWwfmfCt1E/gy0CAks0sWnVKz
X-Gm-Gg: AYBFou28z3P9i10FNyu9EUaT1vEMP2zS9rhGyJLMdGRg5w5YcXOTadOqRDiPluK9K7N
	k7vq2vHbDp7+OgmvOD/WjQMsr+UrN/VeBURamxAPTyNiTenDXiEdR7VQEBCKUDgsBE9F1Q2AJpE
	iCLgKnOaRdpSK8ww6/IkLHYyBuuPJ0GqJJTZfO7OusfTCucjO2wa+f9khe/hOpa/SoJqWODuKCD
	vTtCfhpmDu7rCgvFK2w7jFS6G0Y7bHSK62bldhDVbUNlPnMbzuDvkn19vX9PDeCsSYm457lfpPs
	3sjB4k+QMdMZ6L6Ip+OH9F63sNPgG9SwEYUI+mtG4y+TSDxL90bb/sQBeqvzrMILcNx0d4kL6Ex
	7IWt8B9fhng57CNAL63CIb2cZ
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27669c88.17.1793124524627;
        Tue, 27 Oct 2026 11:08:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4247:20b0:163:8b44:902c with SMTP id a92af1059eb24-1a6cced1a1amr27613c88.17.1793124523711;
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:26 +0530
Subject: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
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
Message-Id: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0e8ad cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=crv3FWtqC6gvpUHg9-wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: gr8UlgqEIcFuvsDxrY_UJkfv_S7gzzCx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXwy4f5ug6w9fa
 8A1tL7zEnLloJs3MSVBjoHjME4/mjDQO8uEijVTPVAKGUBOLhjyBbo6JNQRppzQTUgrIUIKh/z/
 N5DAd8BGq6ktCk5K8YMX8GByCvo53qg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXyscp19bnmJO3
 BPA3rpPp5BG9ZLRZHYmQABSaPnKM1vQ350KWtN2kOA2jkx1vrr1VIVgmbr6hw9n5eIAbQcZEFK+
 ybA1JNwMCLutcLEPZ4fVSHxD4ZxNKQxPmtTfQG18reVUtIudhb2BLo+0KJziWzQ4BW9h9sIhmbb
 Yp+tN6jimQc3G4thL1g3rmRABkNPqvmrfCAtZ0EMlke0Mw9eZLJXALfTaCWlD6WBjuaQuj3enwx
 KvvWjvn9L3ajIKy/qSpP4FvLLFcNBGA1dHqoH+MfHSlSqTqz7sYswjN58hA7GaeetxUmKZuglro
 ls5V1Vy5UXxYtVRWGVqWK8dEJergKcCsdTjDuKVX+UXyqiqdpKzid+hRTOlSjptqqzq2pDZO4gx
 Ol2YAZ8MJY2iYX39o2KtDVkRznLELiIDylY/IdRDCXJ3sI5Pz6gbLSZSYhbIpqye3xYYTZGATAR
 sa/HThxQfmp0FjPthhA==
X-Proofpoint-ORIG-GUID: gr8UlgqEIcFuvsDxrY_UJkfv_S7gzzCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

zonda_pll_adjust_l_val() obtains the integer quotient of the requested
rate and parent rate in quotient, but writes the requested rate to L_VAL
when the fractional alpha value requires rounding.  This programs a
nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
parent requires L = 63, but programs L = 1200000001.

Use quotient when calculating the rounded L value.

A GPT-assisted review reported this issue.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5f16bb55343a1d1136eb07f3c050f..9782fb062a58a26daf3e911ad23c5e1d805b0c38 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.34.1

