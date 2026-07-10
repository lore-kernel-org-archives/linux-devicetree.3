Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826F403EAE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687851; cv=none; b=EGeXp9c0HBjgToHutIuFiz41SgZdEoBz2GEI3Gj12nOjCuM7OC0CpvGV66YiYR/1XbARStGa5NTDkHeLSXRwxQVuH6+Adc0AREd3tQf0FuqUp+Ol+Ihki27NR8R//+6Rk+bYyFFW0fEb3GeZo6yPngirIf9Sw01ht0P3uuC/4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687851; c=relaxed/simple;
	bh=jjlisgy5CZ0XmabLmFHM3h/gF1yjVY5iGsCD6/lUfTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4V6S2XmiRAcaybSG5wr4IrwolYvwRp36s2iB9X9JLPa4MDObajIya3UNq8oRX/Gjj9agDW5oQUQdibRTziw51SqCt755IOX+LdBm13zaNpk5e9fYSj8hhXDhUHZK8dJhPmiRj3pXwX1WTbku2F+8TzzA2jAJdQOb6ohSKpKHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCtHakIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6JvVs0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCtHakIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6JvVs0K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmZfa486437
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=; b=dCtHakINXNv+QL5q
	OdUyf4n0w1Jl84nAb8idoB6pPlY1RxPNyVlgOl5Ey697B8SUnaN/+sbf8Uz+c1nn
	VRFvT2J3qNuOwgT0dOC0GeuqgXlPQVcOwpTVaxCQPXWKjKnW52nqmgytdQrrcI3z
	9SSa+XgqMoo+uORUPNSVKpqOM98kSLTy6SAE/aRqHDEhHPJr9JjRipjUl9ILs/xD
	8xEs4G19qJlf5hIjsXAAePd919tfq/JYJBswZ06OJLtbaQ+A2YyysCn/aYpaWBjr
	FRUPQCcrG6Cwgokl3/VPJStF/IS3dD9+q7iMGlzfX8kke0h74Fo9di+ljlLpqOcu
	kkCvFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtb2dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:50:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so2855651cf.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687848; x=1784292648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=;
        b=e6JvVs0Ktafo8QNczkAk0djUU01DnYWLzGfnY00//HB52eCOLrn9+5c/ynbWz778bM
         cVjHCREowLq0m9f+WPp2XdTFZWc+PKzbspoOYisBGj/ZKviy2BqAUt3Tx49Wx3RNDfES
         7a48lKOhj45ldP3CYtKCuPPFVkkGYUOzyyi5LtAMnXGn2TwYIVJXTZgN8m9IQlXHNdzp
         WW96AnznY5wTvQFV1bYvMa5Wr4JkINVlbcU7Gta6flwuqRAQ44WnUtMrjClLTOE9zzu9
         zPxxtNyWDNcw8suMEPbog3n9ueLmW6LtRUtblr94IQTikjhlbu/YK6jXu4bmKNRMu1k8
         6SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687848; x=1784292648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=;
        b=Oo8FsoqmYd5rtKzoFvUVUtVafInw/S63zIhBUR1AVpQYKd9Tvvd0Ll6otp0Mnki3Cz
         1GyKcyq+Z1A5/ay11FXdqfcvI2xwHtYisC6gg4dP0B1ykjc3XtAiI0vGW9aeXRPffLgS
         rrmP7VAHTcYAELpYodiwKEXwciLBV1V9t6Nh8WBrGUQTBqs72mSNQZAARA5GMa3S6DOB
         H/5IswzJY6DFs4CKM0chQCRtqFqxU1EZ+v3P7apcGpM5UMe57RgagXP6xxq+Vm0Lj1Ya
         cQlsIgLNIpa/p15b9mceGqAb5n1bDoH1s2oMwJKsgai0/kfdomNVBSW2JSZSaIseONrs
         ebRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoS4KMoswvJNSWUBPkowLc8PJZxpCEoqHLaqr5wbJG4/PPiXALZJTkli4BzNMnZtVy+Tmb622+EGc6V@vger.kernel.org
X-Gm-Message-State: AOJu0YwSP70bfaY0mVIRlDhZDtkenHNYkd97NeEOmhcWii4gVGxUTY0J
	r0tiuInqDvMWcbpNn0fMVbKvqvtZi5LILSE8ouB+chQNfDWtGGJN94jvC/r9jPjwsRAOjcYM+vm
	i9wlEbM2OyrVD7muFxJSqkYM6V4cC7dGcoGPnvgcRC3mThRlKW7qYwp3TogWELt8P
X-Gm-Gg: AfdE7cms32I5r8kqWpBq4IGL7JZeoXbMOxD1vZSMbKrlpho1TyQyzsLjJ0AsooA3+Uo
	PUCqOqUGs1Fk/8KLlX93h0dJm9PqeghkMb3CclwajSzzQuqbAf0Td8njL61KCrIkNPR643sM7vb
	LYUS88D4WSoAOwXQhP3+M214g6GN4vGPMRyGM6zzuyu6EGzIT5WPiHB0oD+T7i1guqOuQxV/wtx
	uxQsnvhgDRLwF9dPM/lKBcB5kZfzEUtITL8WNIEFqtuEbrFLI17HPFA20AqPbtgvKswiouSLZXS
	n5VrImlqGPWyhObMR07SlT7Ti2p0Cf9WauiNxOi+bA5iAHFzrqXwJFWaiQZYCwDyytH2SeTXlIo
	pzJ9YrCIDGSEMbjxjl01f8Mk6mbueCZ2bhFA=
X-Received: by 2002:a05:622a:14d2:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c9684680fmr69782651cf.10.1783687847967;
        Fri, 10 Jul 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14d2:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c9684680fmr69782461cf.10.1783687847628;
        Fri, 10 Jul 2026 05:50:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm644150566b.55.2026.07.10.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:50:46 -0700 (PDT)
Message-ID: <c410d69b-121b-48ac-8a98-edbc25a562aa@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50eaa8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Esvlqrxgz7qNtk26sMYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ryb84HYZm2SeQXOOVS2Xqhy5q_pqB0yc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX0m1zsbUSeDgh
 8LgT1aBbcytvgOyQ0UVBheAMWsbm5Bbez0l0KOzWPpK1Fto5s8g2CpdCppe+IeiLyoNvgkjx3qI
 adtLSKlJgShOdn0TlB67jY/b2TvwzaY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX0+JS9Vy/5n8u
 wdWjqFJcyruzKgjAKSGkhUlWg4kZktkjf9wqBHGpeZMb4lvWI9NJXR/Jq1cjwTKcmdyzE5fxwn2
 KgITCPCn25AA9ZiR7T0HhPvLhwR5wwe1qP3wDItch/YZtDT/mFWVVRBCDg0zsSBPe1cY2HQPjc7
 8CbDlQeTYqUWuJQgjfn0PkAHd/m5545y+B5QiF70Dy0NOTUHz+iKgmGS/fzjPEXuMQz5IGjjK84
 FjF9QH3Ui0kIfdqugcy+fp6e9BPdtg7bfiZxItJxfJ9BzeHGMQfjEO9gs+FjIo3VCyuSbX9L8N8
 C7Eu1lwZcNkCQx1NbGIZ3EOl0piqGld+/f2Kj78fLrjtl53CvYI7QGr3rX/tlaFdd31ZUcwmco0
 pk1imKwwcWi1HnrdwgWST5DF2ReolOchCSUtPvvqFfqbbwiUlVy2NafeiWQl6cx6Yy/en0Sf3yH
 G6kKyYkE/aYPjt2RV7Q==
X-Proofpoint-ORIG-GUID: Ryb84HYZm2SeQXOOVS2Xqhy5q_pqB0yc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126

On 6/26/26 1:13 PM, Umang Chheda wrote:
> monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.
> 
> Add combined DTB for the same by merging monaco-ac-evk.dtb with
> monaco-evk-ifp-mezzanine overlay.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

I'd just squash it with patch 2 but this is ok too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
