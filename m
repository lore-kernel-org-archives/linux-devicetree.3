Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E563E3D9D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795530; cv=none; b=YxPdcW8twZW0P3QiQQTiNTqR/tg+cZxhI0wRsdpYfn/JyCHDwssmIYLENL9BZGhjD9BFfK1Z9L5KMG5xW2FUc5Qv+e3Iv5tpsYzVsWVKqlRW6z+lNy5V0+N4oM1mbIjOfoysFM6ovapje5IVJqE7uz6zzcinubMjuCtsege1UAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795530; c=relaxed/simple;
	bh=Y4EyEFYSbb/f+hsFEfhvNwUGVQsnvSEVf8ZkcHQkZEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS04fl0lG9upMpSbhC1nqEe1AFk/12h0SiuYbZt79N/ap6qum4yvTSiZOwLA+PgGozzHgU3PEcCIymHHMR/1pl8PgkcLf6l7oUxfGtlFL+9X5OUxXUX4X/nrOkvc8RMybsMAXMWfkNdT6FxthffYHKQ2ka+kwQywurTtb3vTRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOIOhAeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfF5zEk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOIOhAeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfF5zEk+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6afnH3263566
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=; b=nOIOhAehciDL0r8X
	yax84JZEqX9g+t2judWawswD2Uerl1ZRRmEoIDY3F49rDrIMpX+nQIJV036GH+UK
	n9GPI+W0ZH9zTRySlJ8ihStHDQKr7wNUGGYtEG5QAo5zEe5BNxFrVstAjhMFQqhR
	GGm9pMteCbYenttuAHge1wF1wJjOdE8MHm28ur5+tWpZ2oJqnv3w3VgCaFp1MvWk
	m2knHSnGOsgJ3pN2y9eYgspWZftFMBlhzq2a+b0cZwuz1szHo+v6DGCCi7QujOX0
	7ophqcMsUtW9GbcDsH29o0b8uBE+VcR+SavBsOc4M1ZdcZGUtsMxfpOIdCSyYvyM
	zjqHUA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs48hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so5903094a12.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795519; x=1780400319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=SfF5zEk+Ij3OiSDNbYiE72+rsgNZCMhb+8dgr0sDzexKqhxcqmrv4uvyIs8zBxBkec
         cWIvu533YXXpYUyYVcn68txSqMJxOUMC7LTLwSzXlUCLQGCoZ1WF/WU36cUnkO1B9CtT
         lG3lnxvQQTD8EyiZrreYiiLRsMdqILuGkmWOw193y7+FHFrjV6BlREIyl7j6gFut6IW+
         6Gl0yN31toRW1iJ0g0Gb7nLDgrt6DbZvReoXCR7PJMoirHJCDt+R7SyagIa2VI5zTPb0
         xhIC7BAaqo0bMlZSZYWLfiCRihPiRq4sQ0AFnBqKsK9EmVmQOrebH1blpvl/LdrUVZtC
         QPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795519; x=1780400319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHAu3B+RqoYdQwFHmyU/h5KRrBLinAR+rlG1dzIMfnc=;
        b=nhFalA//zBQcdEk4/DPrHW8+Pu0fuhOGSaSHeubrOqu2YFDbzB3WulzukdcLpLQkug
         Bp4wleXdbPqSJ3lD5jjaxTX/DJw/jW0efFD759c7jsuh7AxRZ6He/4hwVeVL+rTuGsQD
         n8RiWasfJ6HgsIuihiPcvickRBw6Lv0ZiWfyv7nY8xmS1sI1PMcZitIyAkEaNiKiQ+wf
         ZEQ3/z0B3qPNTWyI6ROLuY84B0XOY3LZ/N2Sbp45c5Uv/7UGCruJBep21LwNE6MlMoPb
         TnH0KCrzSMW1b9R0umBotydaw5PyEunPi2S1jvqIS494qhqPbgAR0F7zqxlU9377ONG8
         3vZg==
X-Forwarded-Encrypted: i=1; AFNElJ/dYFXhulRo2Ar1CZ9gLCidE9VfJLhPY9jDuTLZB01cuCsIrXmA3BNFMAiymo8z5pjxxs/lcD6l1BuW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kPPMdWBibkSj0HL7Hqbe05NCVXpx7EE+JGdam9DyF31CXYle
	h7U4q4p016YQeiODON0seENw6yy+6qYVAtqqYMm8HMK6Ybxhr83bNJd2PGoTKlfbKtuFZDbMmD1
	6YY1Bk7x4rs3LrOhkY47o7ZVkrqkHyiPb67lMRIRXFS4z/bw2GSkPa5dpbpCUsJ/l
X-Gm-Gg: Acq92OGASt4a/jFh142ogKhYqaIf8rK3IS7ykYyCQMk8pgZ4c+mMxcV7i4pUoe2KqO0
	xnuYYVSmH6z0pbLmh/p/vuOuMkVv7n8Ehm4HkB4TCaeqQTf/+AehApss1+RZDD6C9xmydo4iThb
	nrNlbPRIIFsP+K2VA43+8/7QkLdEnouvWtKzUZUflMcd3NTB/+GcUEcdncL5EAcGiWkowVnlRdy
	Mt7WuZIhxo6fFZlRq8z607Ee80kjBjsw2SywzjJ9OrOV3TG60YXzAan7y+5m6AtZ2dd5dDAJQr0
	RBhFPbml4OducQAjtF5PZu7PmGrRUiQvLNShoO1PNPcJZ3i6OkTLSgbf9Y/eoe3vUtd80+r8uIz
	E3MxE2fekKNHeDcQXjCvSiX6PQY/TWH2she1gNt3gaSpbrOz4
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382855b3a.4.1779795519478;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:6b91:10b0:841:71fd:60c4 with SMTP id d2e1a72fcca58-84171fd649fmr10382828b3a.4.1779795519008;
        Tue, 26 May 2026 04:38:39 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:38 -0700 (PDT)
Message-ID: <2140a893-8959-49d5-83e2-464ec79e0801@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
 <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a158640 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=StVILoaL_uWnGg5ebB4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 05A744W6diBPKUcO-QKX5zYjFQpNd4ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX3WZ4mlkmMx8h
 BJbwdfZcAHihLebEDAFivWo3ohoVQCGs0/PIdR09y7BsnyRDcLlUtU3bnxeTLyDG2ezwn6Gledr
 Pz1nAajgQKMX9SnUdTUbdveoM46o/By8Wv/rapRimHA9kSERevrP8qGsvETVHt1v9UJ0EG48ZPX
 No/jUUYGY8LSGSk9a1HftDuQGQpKydtnBKAKC2Sou/DR0ucwQbt95MNPwr7atIh7yK6J7RdsUaD
 uKVo/raufNCmlyMJ4K4c3TzufPkC2JMVg+M3RgX2fv/cI1JuvQ9OWJSjiQPn/pGnfhxisLXfyVV
 t+fGX9OiPLNceEd7bT9kJVo3IKp5G3ZwiVnTs0gxqS6rxwcR7VfKoE4D8c67Yv5RHwdPC9R49mz
 oaRQ5Q9j6+KITH+yxH8syE9dQq6ei81P5FrUtD7RAxsTMEAa2OFi+YUCnr60evw3cfqJ1uQ+A7s
 ZCbb4aBAN5jf+IMvapw==
X-Proofpoint-ORIG-GUID: 05A744W6diBPKUcO-QKX5zYjFQpNd4ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101



On 5/25/2026 4:42 PM, Dmitry Baryshkov wrote:
> The camcc and cambistmclkccc drivers looks pretty close to SM8750,
> except for using a different PLLs. Would it make sense to have common
> drivers instead?

Dmitry, on Eliza, CAMCC and CAMBISTMCLKCC are powered by the CX and MX
rails, whereas on SM8750 they use the MMCX and MXC rails. The PLL
types/configurations differ across the two platforms and the frequencies
across rcgs are also updated.

Due to these differences in power domains, PLLs and frequency plans
update reusing the SM8750 drivers for Eliza was not considered.

-- 
Thanks,
Taniya Das

