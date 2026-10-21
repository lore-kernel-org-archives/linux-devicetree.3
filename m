Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573565;
	b=bhFtjCM80CPXmA42uS8CyhkDfhJClfeFLYA86X6Ni+WC4LlfO7c2edRVKa38KS3cL6T8
	 LMFkPBa+qhKFcBumvjCs8PZgX/ALxwZ60CoudYgk9pMgobvYzSmSzmr37GJsszfShcnrR
	 G8U2/FFKtcbx+WY/AUmP8aTTJCgNgkTIdMOnHu2bUTdDaXZRTJxiQpLTMyGfLUX0XZmvy
	 US3jJJCLNYr8xJiyjV8CC9Eu90S+5i7JGlCvJ04+76V+aypxxdgG5hQ+IFshL2Jx7RFnv
	 gqwIPMlNnGwb9DPlEpycB/Hl1yIRE8dZoalpTFbq+B7d0S4Y31SfFQlzabOGv32v3WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573565;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
	b=Mkd/RKfOmYPkqG0+t3RLhDwBdJOCmtmXi3Y/3eTqBBq0TMqqr8939uRByERwzLIyayQ6
	 yCuuNZsPO9r1ExXr6fRJgeIRobhUGoOC0lzIxSUaKc77QvPLff/r48Qp0sy0oOhJsvO34
	 RpbsOQyWE/fu8FKmcn+RfDbIgVKXg2uZKHSDxvAVyvIKeYr/XB1QTwcma8MV1OWLlQoal
	 yer/uI2CUiKYvQSlni6v9auoATGxt0ZUuZzdISB+PGMav7fhbCgyuGu7kTlQaNa6lg6ky
	 nqk6l8gmvGq4JU6DAZ3OM49ArNu8KnRx2e6XFr1ktyOniNy/gf1T+jnDiwiqcA3/6pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeZiMDHF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF486606A328
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF486606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gog5hrfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeZiMDHF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMvh3573312
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1ER3lUc97YATqDpNc22hGvk
	HDFIWxr4xKdKGaCIwaU=; b=Gog5hrfx9VOZjtUe4doedrE8pLSZtW798ZiQCrjn
	3u7L7DCuGYDQs2g/qi99SRpJJKIzm+g1xO661a+wLX/hmsGgYM+yDyk7NpUGt/Hp
	BYJkX7UY0tgeltlzRXdH4wGaGCIF1NiZA61BACU46oIcTfTDvEqtfTIyGor+rXHL
	yQE3cCVC/caHv8LzATHrnc08yb5piMgjpfBANf7C/tL/f/+datDAqYgrDfu5QHPu
	SAzybmYqomti9iZg7npu50lZBZfGwZJcwU4vZDuctmpRYim81VoeESnoF+EjZcXR
	dyz3T0rt568h2qsX8n4AWtHbBH5Qpfc/5KaD9rXjb/1d1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu4yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:06:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e869e00005so7040825ad.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792573562; cv=none;
        d=google.com; s=arc-20260327;
        b=QgfIclqvuTKzGygeY6HvU2SKymbdx9tZVzwXy9IT6MOoSickwUMDYVsltPDysZcecD
         dCqjqS6Ik1Q6lUe/26K0e0XLoMPrNdcJvfBzU2X3Rk1W/PSw9Hy9IqLKWcNUZuh032Kq
         APL2kjnOl9p/ZoBgxgXdF9YPwelT36DNMF4tUOWW4y8RiVo+/K6HYldcVOWm0DwjLIoS
         acRNX8eGwCQdkZdnuxw+T3Mv2uYQXY4TNIyTvHfzSaCwxFJrTitF+39RdXxZnb8nXw4Q
         wyaitU2ATlqXIwbRBFA1ougWA26Mpi1zKGyZ69NNf+prabc9j33QhgSdnppRa5MOq880
         omyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        fh=dcqL0NX8nVmsChD+3w47e8Ox5k+ckCNnYAsXPXcM+uQ=;
        b=EVOA0x0jbMuA+R+84ZfjSgWk3a8F2C7fevNq4qWT+4A6z/f8KGy0dbHn2Fy94/A0jw
         49HX/nG3qMMRytTTBwr2xgdlrJSuD9ykxborZrM9nA0TKek16gB29ix/+UdWNTZ7EKjx
         HPHaIBWvGS+D2hpMCpdFscTzFEbJ1MSgvBn6bp3JyQOyvx3AoasNJklEOXMB9BwCeQdU
         817RHxhfba3lO0RRjSqDsyUBKR/7991VIVNkiXIOzJULA7obUJb+orqY4UkJRhvIidwI
         ASJleff+hXLBQ1Me+ppjy7K9X3gnrv0vY53MVnvO5FKZy9E0o6KTHbYPpYDLADsItInr
         XJMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573562; x=1793178362; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=BeZiMDHFcDmPivZ7zOPPIJLpxL5O1qdrR0Ai/ekMM0p8nWbIlBo+KTbqPjfA3a5PDY
         EBIbjofxsPYqIPASyy3wmLKS+bBIU5UeU8y8T98g6y9r1aGyiQmNNZsDbE1DDvCpOo5R
         YvbN/L6+fssUgClJd+81yMWQZTlLApQbVuOlCnClvPNXFeEYpamTY778zkWmFboPjOun
         blDV+rY3sonnfm/RtOUGybZG9m7dtHvhaFXaz0doLas9OCs/pQ5spaL0JCjH+7+VuL/1
         j9eRtaNnTUeRIqkWyvXycBWbAvIfgyyw9Qf158VwRGBZTOMALsG6s5B78qs+PYOuQnCs
         UoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573562; x=1793178362;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1ER3lUc97YATqDpNc22hGvkHDFIWxr4xKdKGaCIwaU=;
        b=d3TeBsBVjp4yMWcjl5nz3TMEHqcGD04cZAW0oH4ow+Pj56gfQlahpSNwHVx+w3+w94
         1GMiXJjIc5vGOfpsxJzymDIrpq1aSom0hiG3zSft5/8XsS6RBSLFrC5RQao4egQgNRjJ
         +8Mhx5aPxWTc5fA5CH9znj2Vi1ZrwNKhXf2iiWnMI4zwa5Q3Pzevq9VD1w68r18ujLgX
         c6q2FBLfQqPuwEHD1q2rSmLwaF25+EuqfzXotNoMjkt78XaDqKpxCEFwj/ziMIwqjqTs
         uG6CFBMY4vjtwtRUYlT47qCWEsmshNKadQ2oPBctslFyJM4Ls5OPOwYpBxMoGENz5lWv
         ZcEw==
X-Forwarded-Encrypted: i=1; AKwUvBwak2YTt4iBJwPcc9XU6nFELHcuLNb/k3SDNuztuS+R71Ns+y6NPyo/PI3YGDePFvOfQB9K5Cf1VwJa@vger.kernel.org
X-Gm-Message-State: AFq9FYIk5Kb8IxzjIAIKxxJkihWWH0z3Z1na6f1HwaVAGFdR7juAGpwm
	rkWSDyB8GVcpKkGMSrpoca/Yb9XTFae5uR6sbaeKi++Rs/cH3k9Yk0kq+h4E7jQ4jukww+iJLxk
	78G12NQGpfLh05GzpmXzH1YBmca2nKxAx4JPha0fGT/Jo5jrE2+/nUry3MRZkrxedX//WQJ5ggn
	RszT4K7RU0Tp7TXk9OAE19SQE8/YS6JK6wQWVBqSg=
X-Gm-Gg: AYBFou0uJo1U+gWtVXrR99sUp7cVWb8LhTQyCVftLA/xjmTAHSjLbl0GCCokFXEy+hS
	OiznhY9SMf3CTzPxpUqVzeGDl0yOY4NFbdy51WxtDoD2VdprkK2EuMo4i0En3sag2L+Yj44Eu0N
	vHDAm+K+NgtnMhACqY/dRpfS/zEuCZASkQowej6uu1A2Q6Y5mF1xpONt45kQ==
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id d9443c01a7336-2ea4396c9c8mr11805485ad.3.1792573562349;
        Wed, 21 Oct 2026 02:06:02 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e2:dd98:59e8 with SMTP id
 d9443c01a7336-2ea4396c9c8mr11804805ad.3.1792573560244; Wed, 21 Oct 2026
 02:06:00 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com> <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
In-Reply-To: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
From: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:05:48 +0800
X-Gm-Features: AclHuK9BlICWHwxCq0lejQo5U0IbInRuJeKWromlRSOMPAdiPn8Fd4RwhwbW4Wc
Message-ID: <CAOK0kb90wYEQU8e9wfQ8g_KfkfqwiQ9_ideg2=mSrU8OuTLxRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8807b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=m8YJvu37PK3QkMmK4r4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX5rNFBuHkgNwi
 g4w/lpneZdgjOKcsgIdlSh+rVmzBpIHA/mKZyoaIqdrBrWpPFQm/qEOwmniPmaRgqGF6IgQnS/2
 ZvmGmhCHSgXpNFbjc+LOdETqLfi+ZUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXway/iAFoVzwc
 nfhCvUnlrx3gTaYFTE4jHDyLpUrw7R0J+AGD2B3QZj9Oh+81NrNZw1PSPv/TIcbATNqqAbCgVfv
 j5EP3H+RvCvrgBIWmBj1CqhNOdXD4g6VJ4h0UmeXthibf0KcQ/NROBnNYXK5BEX9HV7VYam1UVF
 1n1wsWCx2y7VcOx7X02vSo7YSwqKUBP1wNaK65E0T/IAhEF/sarbYGp6L4GCP3lY1kvdc/H+rWn
 H6i7QkuTL0VV9uQbk2MQyMd5eeYtQbq8T4lHgK/b42c2O7V/pjXt5bDfjKSmi4dvzj8iQar/iPw
 ZDZuF2AbtWThxTw1BinjpZZW7bnZj77eQYL2X1iYkMrLx7FE/8j3MKoOfe/YLM8aiRHO6ecR9SI
 xf3CiiZznhofpv978nvaHKvfrEcRPAyBxw2HLjpiELv/nuTNyN4bpnHBcLH3+QR5KcrLXC+mBwH
 OxOKLm9z/CjeTQijQbA==
X-Proofpoint-GUID: kRIG0dg9h1aUvYFS5-HI3W-IVIKwE3Cl
X-Proofpoint-ORIG-GUID: kRIG0dg9h1aUvYFS5-HI3W-IVIKwE3Cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Hi Bjorn, Abel, Konrad,

Please drop this patch.

I re-tested on Shikra EVK with and without the RF_CLK2 clock described on
the wcn3988-pmu nodes, and Bluetooth comes up in both cases. The
commit message claim that Bluetooth fails to come up without the clock
does not hold, so the patch is not needed for Bluetooth. Thanks to
Abel and Konrad for the reviews.

Sorry for the noise.


On 10/20/2026 9:40 PM, Konrad Dybcio wrote:
> On 10/20/26 3:08 PM, Cheng Jiang wrote:
>> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
>> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
>> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
>> to come up.
>>
>> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
>> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
>>
>> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
>> ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
