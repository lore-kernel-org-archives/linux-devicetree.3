Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576B3546C1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783969123; cv=none; b=RYB5IvnW9yeZFzx+VKO9yuk5t88bOWQnAmXtensCL4bqmZ5SRIMIkRlC3424bdRHv8SyUpEr9O5BoVBMtAkRx7PGJHjKY4HpUl9SztaFhX5ATfZ00V95JXszGyF6w+1JhTy+A6eYejfLq06q2cG6Y9Q1wtUosC3t1XV2ICkbIiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783969123; c=relaxed/simple;
	bh=Q4FlDRCpngp1x0aC0AgdewQ8wbrSnrUV0YCYHer0W7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAKLr4aLI7CaSH6z3U5a+/SpHmPVOaozL3UYTikj1wqX3Mq3gHcLz0SH9SBqQsy5DLiNgu4cPlS9wzfMwFJKCRHDXH7q0KERzyfFDW0Hi6H/b/EE78XkW9weANF6gwOiaIZVZlZi+9T0+inVitzK9UksFVaIwlUcW4yrpSlk/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdU4k/7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjgjV8tY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdU4k/7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjgjV8tY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8o0n1908394
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=; b=WdU4k/7wJY4565Q3
	OBIv/l/9/g9bOCtXtJdW5RUd40bhhXJJtBGCi5XyLAHtadKYz5hVdLU8knWINlps
	bNUIkviKqHLWLxv9gNI9iqXdGJ2UVEa6jsENcnQVNwq4EoYLEz470KHRNeHUHT8o
	sa+g5Qw8UDN99M8RL+ra2kDJC1ovboKK5zPW4s1STq08y2RwX3+UBJFecEuQ8H0O
	9XnFwJm6nPXYLi65NhRQ+zIzTRuprHoYo7OT+5G6P0c+/w8vIfA0qbM/PnP+tnvS
	HmjjtQxXp4vx87eHAWKG9gGELlUiYgWMLYLOoSeiuwkqWt+92FJ1lGBo9st/xAKt
	nCGidg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda28dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:58:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so5308688a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783969120; x=1784573920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=;
        b=IjgjV8tYOBtwKq394jANMNx59r6lzns1gtRUHwX5v7l1Q9zJYLUKbHXNR52tQSXVUr
         ZOeEtRot9hVlcPw7uMa7gqFshIpNN2qUSDiBIrTPtG3R3yllId9kw/DF45Fguja1uhnR
         33otf8h84juUsW3oMxzdl7kXKZYUMfhnXsX3UnO9Uk3w5ah+ZWvmdFMM+I0FNMc9W7OW
         360eAFp5JhphHlymvmT1BfFDfd0XE0BKmVXOQ1pf/C+89h3UDNcgc22JV/nVcYNFtJuq
         UVPHEr1dyJsG2BkXGHj7FK6bNxx+Taj9EcloALrolP2R2SfSTrU6MC1ocUF2YO1KuG+d
         qd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969120; x=1784573920;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=;
        b=VcPotNwoddUc6u3uTueVW1qst99yRVmZdIUiJjUlxEtTA76DSqCJxNDdvLJmqroSzc
         +OJtk7ZNiJ2P1b4yj+s4SWWg5vbQd18qfNDOXpMXsK96vX1K7IvBLCUbROHgtqfN1hL9
         bFIzLABy+JRd2H+Zn2CV76+r3jT5LQId1J8EPPzRaC5fe6kP8tmbNkj4pgRH6Ne8Bps5
         ax+f024KwDMGm84R3flwxZJnfvL95My0/6aXaWQc4nvnH7/7AzC33slCsXeB8mWGstWX
         rC2HJ7gETa0L5epp5yexYIoR6az8vDSFkUF28F4zdPJoatCSY1zOhB4+VUWGYGhyy4bk
         z8mA==
X-Forwarded-Encrypted: i=1; AHgh+Rrlvk4NjbcN10AIbbE2jS8CnDTvfsx2NQZykCgBqcnqlKomvAY+yk9tEneVrQt7PS2HQ1NlyWZP5nIW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVDfeRpVnFOKz8npmW5TxNdY9J7nlZH9vUtMsooNb/fmKGirI
	iNmYRFpiIqfKjHIG8Mmel8qhfHduEEG5x7xN63KBTaHN18hF75Nqi+bnzgTA424b0g+3qKhA+Zz
	NOBHdhNWL8m/OBcimz6w8ltCipPghtIw8JmjL9id0Lwg3+s0DuOgRvu2ElkH7JNe8
X-Gm-Gg: AfdE7cmBVALbQYY3/DzCwmcXoSLZI6SWlbOYLP8fOslSmVbps/KdbnPWFbHFWd0cT63
	yRCTorgILWuSf8Ufb1QsgEQTqLZQvlBoCpLn1sgc4y2nOai8rlbYQDZ6Ybjuaqpvv01v5yEadHg
	frUCiMEEhSGaQlslyfKh4WtemVJGs8ky3ge0DpZWRv2QrVTR9y31g70dv3tABTiE1tU2+FWoqfS
	fMfKeJXAWiRYndKve7qIcbSaNhgztxO9InfYAcrpK1FXlYMMWo2EVG7hV8lI6MulrX6gE28sAj4
	ir+uj9PJUmdhC9IhsZwMj0cUKEk3n93JMms6Tmzl1xtqX2iPba6/nzKAPFSgf3GLSUT74oQJGTE
	Qmqn0BgnF2pZfwLyBOzGr/TVuUkR55Cl/p/fCuxRkwN+bfWhYK1LmotnLk7UFR+YoudQo
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c110ad2e6amr11568629637.45.1783969119591;
        Mon, 13 Jul 2026 11:58:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c110ad2e6amr11568594637.45.1783969119131;
        Mon, 13 Jul 2026 11:58:39 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm83117734eec.14.2026.07.13.11.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 11:58:38 -0700 (PDT)
Message-ID: <09e17504-d1b3-4e3a-b547-3c3c1040015c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:58:34 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-13-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NyBTYWx0ZWRfXzBY3KU9Afti9
 aTm/zcJqPwE9bdeUf5wHXSaMAdnRqO/m6yooMe3EC8KJv01vMgG/9KeuOgqFmJ0FLgKMiRGMRCt
 BfwXIvf4Xu2xz2nlmd1yyFtRp6wC8WY=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a553560 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=CBpSC656wZACrugyqBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: McTQpxuiC9BZ-U9H2wVY4RL0YGs7KDgn
X-Proofpoint-ORIG-GUID: McTQpxuiC9BZ-U9H2wVY4RL0YGs7KDgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NyBTYWx0ZWRfX2Ju1TYQd7E+m
 yjvxLD0wDjU3wD7XvkHFrvuUXTzPHqMwsXz29JGvxZRi39OfK1Ut9V0RQWy47XfWh4gVJfAuE0Y
 eqhLfSjYiJAxUco0vk1AgIeQYH7BDezP6D/pIsYY4U4+hHUL5p+vSdsB+r5F76PJvrDCbEHaYpM
 3tOrTFN6nyHRQFuGKI/1xG4AtxYIyTAu0S6ITtLCboi5LPti8DuFLrgoVnBdC4e6bL68Au1y8TN
 6/MS7tSKo/GJDOGlUrS32di5oFERRDcqhJ7l1uAhbDTa3AdZyeXfrOJNoLpZ3MFPzcz0R6R9pqA
 JOBZAL2c4rO9YxpjlhL4/cgTxaiUjv5z/xwuqKs/G4AApiYahUXTMqwrLUjrqrgOGzrEVr+XBpx
 QMU+h6e4G4V72uDlmC2IyNLYtUCyjDYfH7exd3BiNJLTVIOrmQiLz68I/4DePr6bmiCDvm31KQy
 GI29yQOdg+Cs3nHs40w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130197

On 7/2/2026 4:58 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..0d5d1c55bfc1 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,7 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS
>  	help
>  	  Enable support for Ath12k AHB bus chipsets, example IPQ5332.
>  
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 30733a244454..69e21214e629 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -5,7 +5,7 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -420,7 +420,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>  
>  	if (ab_ahb->scm_auth_enabled) {
>  		/* Authenticate FW image using peripheral ID */
> -		ret = qcom_scm_pas_auth_and_reset(pasid);
> +		ret = qcom_pas_auth_and_reset(pasid);
>  		if (ret) {
>  			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
>  			goto err_fw2;
> @@ -485,10 +485,10 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "PAS shutdown failed for userPD%d: %d\n",
> +				   ab_ahb->userpd_id, ret);
>  	}
>  }
>  

My code review agent is flagging:

**Missing probe-defer guard** (`ahb.c:422`) — `qcom_pas_is_available()` is
explicitly documented as mandatory before any PAS call. The OP-TEE backend
registers its ops asynchronously; without an `if (!qcom_pas_is_available())
return -EPROBE_DEFER` in the probe path, firmware auth silently returns
`-ENODEV` with no retry.

Is it an existing deficiency in ath12k that there is no probe deferral?
Or did the qcom_scm_*() calls somehow guarantee something that is no longer
true with the qcom_pas_*() calls?

And also for future cleanup:
**Misleading field name** (`ahb.c:384`) — `scm_auth_enabled` should be
`pas_auth_enabled` to match the backend-agnostic API it now guards.

I plan on taking this patch as-is through the ath tree since it is currently
just simple API changes. Any additional changes can come separately.

/jeff


