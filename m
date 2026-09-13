Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06653EE1DB
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323098; cv=none; b=kjBh3h7axF5i8Z9kgEaPfL+EGGuce+DaXBhsBW4+iORXqnTWDc3yBiJi9PjcUoQqfJjQwnBncTDQPeFsSzLU2T6avkzIV4Q8R7YtG6NOcbycmOa5frY727INKa4o46akc1jRXEIDI26n8KUkwRs6oMdTMFUBgMmg3oknfdRJ5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323098; c=relaxed/simple;
	bh=NMqQI2fFPz4/wUymU2gtoWMUD3H+Ph+gfCtmWeThmx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tThAXHF8Letx1SeaThEYEvA7yNlKpxzYuQXK1sBGyW2f948FoFrs4+8sRUTYbIHYHtEuOHFMkhs7IawLImZrdAxSrV92kk+msqBTFmiVRLSkDGV2r/1UZBIfxBHs7mx9xQrO+txVZw7RGzx41BGEp8lc3Pu1obQJFS6obA11TgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y13wcTk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbLMkUAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y13wcTk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbLMkUAz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2lpe2614318
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=; b=Y13wcTk+9OrRJ9of
	LPgRLx5jY1IMZEEXDeCsvF/nTL0LmMKpd+NUP225853rBgh7nRoNjVWVReLk/nKe
	6yiSlCWdj4Lufvf8y7+hfNZO6N0fF8fxisdnliWexiLaUpBuNfpV7rgsrfIYFv8/
	VVbhSs+fwff8+i1DL+dqhUJ4jVU+W0eHLdR6RzwqLRDYizOI/d8ZKHuD+Q+zSOuL
	vkQtxFn0QlmbYQXjmzPgASbw+87TGaIBnn185thOJShfx013LOmYQ7C2rpYvXLou
	mVsYahDHHhKC2vWzm/+ciLXOFvta/n5YaOwPlhgJ7+MNr74I6oKzc291nDI5MObp
	TzznzA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbubp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:11:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1789594a12.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323082; x=1789927882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=;
        b=IbLMkUAzYWzgSQKp9Gl1G+gRf8FSaZIuT3ao75k+qMPQjHrZGHVcxXzKv5NiLOEEC/
         Za8g2Mo9GO0Upyv8N9ZTCD+irMKgC9eWS0K4GFaFh5ExKckkJAnyzT8Gw1ZZbA7u/+vk
         0zLdPS93NgkoUOVjbNElVniJCuWOUihwCZGxK4caf+u3BCD2pXvLkkzeOzmG+hfbGTvH
         cdcxNs1HZkSLoVnx8r0ddMe9If7yoEHOh3oq00wZnWSzbdn12hFXd8ikVx/1YwSMGExt
         FujTJL6B5XEUzgv4WCpSWBhnFThhyc+pAW6mRUJn5LOPGz27EEu3oSOGQ8D540DVcxKT
         2fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323082; x=1789927882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqk7llMzHnlTp34wqRR3zNeI3SLsJhQEKBTOlGEeIi0=;
        b=DHgAtmuoMBud8jryCAFa/m3kr9jGxjo+FLrSVJ66vok7KCr8LpZ80ndvsY7ohMuYHX
         qVZiglsrXVz3GfS6tb4JkovuK/oUSYN7k7qgxx014svNiMI7BqRK/wPNpXuooph4A5vq
         L9uzpjWlDBid+yIwd2l/3KNibp2NtopePdTG/8ca9ldYwunTGdQ3jowk0u6b3VYwWaj0
         IW3RTp/rFhq2ppVPLN9V+7pVDFO+uW//ggecSsDPAR40WCJbGzw5ccP62bPLDDdXpnGt
         QFAkA4hLWxxZHvl9MsXfxWvJjxVDmSgVwk6AeqqRmDRLZ3g6XFWJewUl5svcqQvF4wGj
         Q0Sg==
X-Forwarded-Encrypted: i=1; AKwUvByDl0HNgb/5wlFPJ+1MeiBWj9peRtUWmJ7XpYgoTReeg8trzfjr+X7l0K3suyYJ4tNonsoEsp46L4nm@vger.kernel.org
X-Gm-Message-State: AFuF++lgekmXmlt8WBLM9aOkkmkTnKa5n/eudgwaG/qxLfS1OOqbpvIp
	x7DPRH+jzPk9cA1HhHrwhVqq14mjxUQxuYV7jnU0trEtwxkLaOVhafrifuHINdSURyZ07AfhJN/
	zik9AeJwxs7vmgeDIGDX2mqjnJwCt8w15cCFJ1TVfqCS4hwh9hSAuk2CsnY/LiVLz
X-Gm-Gg: AYBFou3tqbXEOviusm32EpCRbSv+83cUZYv96SeCs7s7fHtTGRQNgoy0ipW4lJJuey2
	+Hg6RRlFM2h3DiKEBAOFKvlbHeile27GItdL8v/vMoKC5MxZq9KjM6n42xjsOhx5jZbYFZk6MAv
	V308w0CmbI4KrA5AYruSHlKKgqp6ji+Fpm4+LgdmoAIEquyMjQlVEjDNFUT0d8uGXnC3CbZMing
	LP0szolM+8xSwYxJjDhHcepIII2mqOU+kBSH3bbbBk8QVUC1NstgAr473TfqmlRPprpXKYQ8oea
	BCxbtFN+KGLkPOp94F0+PtjNTc/9GFR3Fgbq4zh+NJPwHBdbhJAD9teWLVLQPhprhFcLMTrgTz9
	jL0Os55NWTaxTtjDa9fGuQyHovv/8K8k=
X-Received: by 2002:a05:6a20:9f95:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3daed5d1801mr27526030637.14.1789323081681;
        Sun, 13 Sep 2026 11:11:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f95:b0:3da:80a1:f2f with SMTP id adf61e73a8af0-3daed5d1801mr27525967637.14.1789323081261;
        Sun, 13 Sep 2026 11:11:21 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm19430817eec.8.2026.09.13.11.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:11:20 -0700 (PDT)
Message-ID: <41b0842f-7625-4016-b863-ee4eb835dfe4@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:41:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-2-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa6e74a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vw02Y3r-7rk9LANHpykA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX+hZO8GOogPLc
 WOIK0Pzjy10qs6D/0JpmK/HjDCTffIyK13d32YmzNMC5Lm7Xhy/p/y1xZxwvRQMxdPWRkOnwHel
 t6vrl8ZJIEfWiH4SrPV10ggMgsNkMf0=
X-Proofpoint-ORIG-GUID: QYCs5HBnmzUJkiCk8coVXngVvrHbVnFE
X-Proofpoint-GUID: QYCs5HBnmzUJkiCk8coVXngVvrHbVnFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX9+tsHdWhIsIV
 KrLzgzd99+qxaLezCRKyvSlktnTyKQpoF1AXaZXC+huEXXC83oUB/Inp6YGszZGNOYFWs2aTT3Q
 N6tGSZkLmpJYL1S0RnIjQwqaR7MHHVB/Uhte12GjzxMschhzmYgg7n+CPg7mmFP1Y8S1ZDxB74D
 KgaHFazCA0sEXIDY6bU5I44u/2rkYKMo5THYhdBzXLSnQlSihUq3GggSumnKZEL9PNb+tSShAl8
 qcl4Iy9JgP4vg/yyXdfN7Ug1XEW/wJ26xqAAP/MGOLhryYkmpCiUBbJRvAVcdBjcJ3uTesNLs7k
 XHY/K8OgtMKtJ6nAvE6H3Na2k190KTNQjGDqceXA66F7rC0Qq3tyVy6p5FkVqqR96yTEWUo8Kai
 kegYNoiDR29lqK2u2UkNsJi3Z85Hd2iKjXyrPuWISNx6Zor+JNTLi5dAvnlxyrYt5fS5F3LP/BR
 6U32GA3Oe08NgoFsiGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
> present in SMEM for Shikra.
>
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
> used for subsystem LPM stats since those stats were populated in RPM
> MSGRAM.
>
> Here is a brief summary of previous targets and their stats configuration,
> along with the drivers used to display them.
>
> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem LPM stats        | SoC LPM stats             |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
>
> qcom_stats.c supports both the configurations for shikra, reading subsystem
> LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.
>
> A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
> and vlow. Add shikra rpm compatible and config to read subsystem LPM
> stats too along with SoC LPM stats.
>
> Below is an example showing LPM stats for "apss" subsystem with this
> change:
>
> cat /sys/kernel/debug/qcom_stats/apss
> Count: 2192
> Last Entered At: 5498618336
> Last Exited At: 5498708046
> Accumulated Duration: 2046572620.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
