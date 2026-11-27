Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769350;
	b=MZLbfXCxtaOFHiP/yRk09WJAk83I9Qw0X0M2HHVOOaQ5TgncrK+Owr3q6QW4K+ta8xF9
	 UUkCxMOSnsDjvUS3CuTSlIPgYZSlYh3SY9+NOavFg1+lwZyUq6LYfMn3oSiGNaUdn34tB
	 T1Zn2ZXPyt8ljxAk9nFhSk5D7IgK4FAIWa5b3smeLG816o/mxM3m0x0P1L9NGnPBlGg14
	 vYSa5iNprxOk/Vttmppu5MiWGBghLE5PWc+s2JCU/A4qGRKcVQ/YhBPS61OS3QJ/O4kIT
	 zF5DOWaxrgnvIlD3opZv1ywIzG6oRmvNzt6FkWGu1476GNKYjqmTM/jf1bq/oLUZjxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
	b=IMTQcAPe+TvCkOt/wjmq5T/qQY1mKau9+jTwfH8rxQCaWB45egGm6TRzpguLsoE5eJKn
	 eqvxVn8bZpn3+XEzmNZ9WWig23N5l30JE3hCA8qtm54CrmVPgKgChDCvVXftTmj8++fQN
	 z6y4n2GjMveJKRVSgn68FVs7x3JxBkS9K7VykBz1odo18oKRrkoVwBZyhQW5Ik5fbWSZp
	 RAqMPqUOMNzUfzgXr9X0Qq6IgVdl9erPxhDOA7gt3k9s5Bf4A2dxzHaMFnLHbpxyLTcTL
	 d6RE5dMjDlflmye94irWhbctQFv7MIBP337mjgJQg79gZoHkpH8EG7NT+H8yuxTetsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GOe0/uRS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9C60A2601
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F9C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOe0/uRS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E4zxEdJr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GIQF1779838
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=; b=GOe0/uRSkU8GHkm4
	jfY1ctRutj19A+SOZUVmlj7w6bpKHHBs5Ul+CQoIEquKlzW3A5X3C4qF/g+mxVmt
	y+6XU3zuXX1Gw9LME4mZ+dP+eM50S70LnO5vRK9hdXAkcoibfxyi7oiHuZm9s+IA
	+dS2iIak2VcDw5LrJf64jnTzVz9FxAvEVzNOga/MeVrp6OqJwCniLmAoRYhTwk/Y
	KYaZZiV5b160jBOWucV5PMB6hdUAvQ36DDDZK3NV/lhammz91I07v2w4kM4OiEUl
	ax5F19uhiTHB8QtKE2dTt4G1DbnDpMQFXkxLWASYOHpuTJJXHcssKCLhmZRvX+Bk
	CG40BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgqy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso514817685a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769349; x=1796374149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=E4zxEdJrYDJcXogKPmvBdZQm4r+9Q2zTkUqftWp8GhTnV0w9T82Fs3XjKBsn7EsobO
         ITE4I32R1KRQg9UTTRLGnYRMI0ZADJ3sHKXOUMcxlf6TELNRCRqPSQt+S4U+T/zkPgWJ
         BbHxZIQ4OBEC8wzEjXTb6dAUCZOe9aBVXYPuO7dejzNyPgWEVpNSFZ6W/FwTESTTWJ8t
         qaDIeim4INVkOJdURvbl8r+EuOUPpncIMc3H/DiLrjXn6U8Tu1q30oftnaFSxf6Z0RbI
         Q9fDL4W6K/eoYniw+FQDp080gBXUfAF8FcC8yRIrC7Fe5SpI9YY9a9tQ+6FUHJZUhm0A
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769349; x=1796374149;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=LgsmNf2ZfOM+VKKceUVlYVkiqzm9ggO+tfLqs8NvZc+om5kEaGQQOjxsDlkdbRjBXm
         ioaolVdmbC2tlMTTSYCidLGw69hBhPDaA9hZXdDAvyg58yfUj4pJP12o0c4uVl9n/tMb
         WYfyZ0Neke+nXVA2Nc6YN1MDX4lpmSldMEQpmJ5bjkoNu4k0SyMT33xWETRC4mtjhlCr
         lC0JdMsq5c7sixZ5O05x9tjxiia8NdmgtyRCEalUbgV+hWLvB1/BrSDRELKtWfTQDysC
         Bmd822I618nMHP1x2ILXG7svh6NKyVz2QTa3vEVvS8EgoTMOnaQSYFlrgJg3NwBnMb7B
         X4NQ==
X-Forwarded-Encrypted: i=1; AL+hErHzAkydNupMVwkWSJDOwP6H4dV1UipFGWXV0aJGgIL/l3cX0UnTNppD9QFoCAsSUbqI/9titifUd9eQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+w93+3AROqKj1rNAPur/LN+DF2N5/I5r4j2HcU68Uyh8urzeJB
	sy3tkQXdPukWJtU6ECXe5VA4THIv5Wd+edk+nB0j1nHpe9GVDTmbHohzKxuBw+opEfPeEggceK2
	eJsDEf00p7Pb1Qx6FiNQQXErSV7h0xCDbkjmn0tUbuQoWhD8cyrflygqXgTmjRH76
X-Gm-Gg: AZFdTZc3pHPJxBNuk/sAFtEmFHnX9HpkPcg47f7EDPQbC/MPZ5JW2ch0aMczE0bjg4e
	3Di/UNtW/Y34x9ts4iQtTnvuxIJSwY+HQKFZm0rieKSp/iJEtnJFOnimgSpvzKo2GuisMzrcOhO
	mof3ZNJ4+QKKtSNg4b5We/YsUTRqCBtswjxswZvq2tNy8q9R/7aiKlClgqg7j73EtiiEm1ICA1o
	Q0TRybAhnH236JUc+URl1uwdZ6BS8tKh0ayCekA7Q5qOq52KEgFTfruJZSl9bt2f8Gf61LcTxNs
	xUHp7os7ScEsUcIyL1bTDX5bdVYF8SeMJnuNLuHZalbmFd5BtbyfipI3oFl9SpS1qIb7/XtxzD6
	6cZSG7P8OaMp7xECwjefG5Po8NreC6PArGakXGUln9P9MhapMm46uyil+YaKvzw5RAMe9W9ivgO
	iQUg==
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923739585a.50.1795769348592;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923736785a.50.1795769348204;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm821554315e9.6.2026.11.27.00.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:49:07 -0800 (PST)
Message-ID: <d24318db-c2a7-4bd2-9216-1ed5eb90a226@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:49:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and
 WCD9378 codec
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
 <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2b7ZAJ9i8Yao
 tYws1GDueUqI2J3HjGHVePk775/o28sjTSbz+2OgoRRb0XJWE1L/uyqrvvwqMK1ttoyCvzRoXad
 7aKdbmaJ0yQTzebe31++ND4gqjEmFM8=
X-Proofpoint-ORIG-GUID: vWVC3uKfBVRjqKJcNWj1L2z1BniV5AWp
X-Proofpoint-GUID: vWVC3uKfBVRjqKJcNWj1L2z1BniV5AWp
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b094405 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=R3xOvuxQfeku2NNc9hcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0w/nVX683wZO
 q8HFBt8lF2po9IfT4dY4XfQy8+1yi/6ZH+xp6bsWPNiju0yKTicPHETFEYYeE75TdiibZ6srMfk
 3GBR1uunlSAVPOYnpkH/dKbxZOHCR271NyC/bcKGvXATRPr/8sr5b1xaP4NiCjQHd2DSZ2Uo2oz
 de13hiELmelGSldpmMLsUR+VROCcWX36wVbz4vVzK6BMFB1bfOgl+G439tUzm/4Rdsb9Pkxdw+d
 ZTgex3mvPX6lZAK+GsKS098TqS4F3yEsfY1EOwNpQEADDQx+Q9VOSoSrFk8Re1yIwWL6Jg5j5e7
 7RRDemWOyQ75KMWUDj2VXPZgFQD5zvn9sDlOPpRjFdeKjwQUc4bUOqkV0R77UzSDaCdt8HGkntz
 vgD+WfZyM4JDltQ5GQlFvKVnzoIPl/HFKHVNOZIN7UENah1SeZdnoVpInFwmfxoj+RvmfoA5t0n
 +B8Uf/LgOoOyXNreTKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/27/26 1:42 AM, Krzysztof Kozlowski wrote:
> On 26/11/2026 19:38, Srinivas Kandagatla wrote:
>> Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
>> CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
>> working headset audio out of the box.
> 
> All of them? This is board specific, not SoC, thus please name at least
Yes, this codec using generic sdca class drivers, all the glymur
laptops, like T14s, A16, CRD and other models use this codec for analog
audio.
> few upstream examples.
Sure, WIll add that in next spin.

--srini
> 
> 
> Best regards,
> Krzysztof

