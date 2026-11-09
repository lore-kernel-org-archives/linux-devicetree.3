Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233806;
	b=RafHK7WBQnIivntqa8FPG0SnN18EH3HZLWDDjCgQm27qn/DEKMj0blVoirA67fg5cgxp
	 6JCE1fPskZsOLii3UuZeEfceKxH0B6HDUYodnAzdgyJPpZwAin/RxcduJRtyQtoBWfUPZ
	 JYHp3sz0qejNjhKqtiODBUX+knvecXe+ElkeJJVuBuTjozuTiZElJJLAulQOIQ/N5GU0m
	 AMbRxuA+U0CNc8OZd/XwTWgxnvLoasQFVeaQiHAOPvjbop1O+glD+mOW4mD3bmwCRXWId
	 O9LWr8VUSv5qaG2YkFBwc/eiHXGepR0D3s7mQK9cAAyELiXZCo321xcZTn9zWO/D/Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
	b=Xb4bWDOajuJUNj1ow3kGBRaQbozFOMNPh0xwgkdzMLrG6qg1O3Flmt4yY4OGlEVzc11d
	 xFLRxsnMJ6tjER11gb7REkqZZUiOOSkRXsVODwqcfIWNPt4aIrQ7E/0IzUtO4hJXqZGd9
	 arATq0hzftiGt76+zDbtsu8+/K+gzg5voIXwmLAXPMfuRLw/QxDvyVYbDUUz2xb4jyvpc
	 yeFR5BsXhO6KAgnoMxSGkBmydj2Y/Pp7hP9OeplAObF9uRskyOpJTn5N9sxHFiJGTz8ql
	 8+DQBpC/qwugonZ+ke+QF1QX2+HN3ODezpfk+nLWe7uoWcT/56RPPIOhcbnjQSrmRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=es6JitvB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F638606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F638606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=es6JitvB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEreH336350
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=; b=YGurauriakt763yf
	MADv55l0Mn+7QLIicKiJcxF0lBKecrR9uUxQ+fi0zGuR8lc/szkS+P7JvDYOpJw9
	ARXsfPfFx0Tn4QtkzVcNkyyhY6cCDP+er0J46exeuQFi5MPbt5RyLTfIZBItcUNx
	vuFgYYJ3IL9EYn7pzadZzTIowrWzzzrNZIMMZdJD7MBngTK/3GvCThDLjnYForcL
	lJKBrv6WIMP1+WiO9BGOwnAN3G+lxh64Gl8NJjn3NfySJujCrr7TZJGYe6SYyGyL
	ICI0MRgbxJmKVonVgxLZF6cocaJ3ieiX8bBt3VLl2PFRMD4R/zVaihXL3rk3ZYjc
	v8zzPQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rnn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:16:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so22140e0c.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233804; x=1794838604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=es6JitvBg9YNIEWA+jobw+XiI/sRJOzf8QtHhiRxuKvIqBj8hm/ir/hkr1W1LcGLPe
         cobvZ+OChwcBd32BJdRt3x2NqKjh/RftAGEM8fIqPZnYpLpxMs6p3Ta6aeFPh9kl6j3e
         fnU5EKn9NlTacw7KHZD0DjR2Ixykl+haLGyGXUKj6TxSrcaRaH0IN5Tb7j7CPWvMbIwv
         SMmuJT3/Dnn3vGmGdfHUWyx/ATm1mkYh68Z7/kGSmwESvAv97C4OhoceL9yaVgHr3rZs
         lhr56mv/u2NOhgp0NEPVEKfwI88WrKmfKe6p/FHLWNwrvQN7ttNe6djnnd74LCkePRFW
         kRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233804; x=1794838604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=2FrG9zmXwSYiK1cYQ2L+0gO9dkAVn0/L4i+qJNul5xJC7nkAq4So2Q0jAqN2bYA/p4
         mzAZQDi1QEzULs2OtZyAkp9FJLN7z4iveMoZAeqGbvZUwQMkZHOKNxwZdCYe15AGKlhB
         psbLDbPeFHWiUzGocJQWUR9zJUdloYn5ZluPxnmUI8DT9LNX4wQWafFfeVHWnsuwwZSE
         n15n9bKUPulgHEII2kGI4JS9UP34F/gPx3EKxHPbjZEnuBRSqd8QrPS7tfFBcTEUdDot
         rQBAY69vbUcxzJGrIh6qRu7O1HzymsKpJIM1m7bNpktbNiZurt7893K6uTWp1zOyfqws
         viLg==
X-Forwarded-Encrypted: i=1; AL+hErGw8Za949k9Dd09lfPBGdv2+vIWy+r4c9yufjBNWgiDT5XnewsLHDob+iX/HVVSKjWGm1n63VGehiQi@vger.kernel.org
X-Gm-Message-State: APuU4Z+is1p4R7YjcSy9+B81tTqLmSZrKZA3+fgj9HlKECkBgtmBTDYG
	4OmuvII0QxxvtRRFGEmqLmL1p1DSRuiQtNJOJQ1eQ03v4uV21clOwedbhzVGyWrL0G5qVALgdrm
	5OPrWJ9YE/CGmZQMsrHWbwW6dVOCIlFeR7OHapyXPiDSlmHC4xE+uCfEtBpQvoLO54f5fxHd3
X-Gm-Gg: AYBFou2fpzqtSVVIb0IS4YMFmi+e45pbpqnOqMlGeSv+VngVL5HX7JkW+2xZjkK1S12
	CavIeDZBr/guObbFwTYF6y926cYDq+8O5+3o7AiGSnr/JU7kmBHVstPRDRzUt0TX6PNuO8912ZF
	GOODLzCMqAHwCIe2sD+emGepVAg0KpeVEX0guTV0ukEBRtitiy8uGDb5L0PPzDxsDNNJsQK0gC4
	UiGlcWZbnTyicbpyopQn0UwZ5BO0ExG2JFVhBt2hga2bG2vF+Xlbh+LzBj7VV9D2TOV8ErXAaTF
	G4F9zfSjaho0lP0fHB1R5adREpH51RngMpmra+JJfEhnRQHaTXyNQc+32vUnW7YBJBrUTOawO1Z
	vssDMSrocmauTvtAxn7JHWlXNOXcf8PlQY3e0IHzUIXq2AWnAZB6p7Pj2QfiX7OkbBrjkiA==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956862e0c.1.1794233804196;
        Mon, 09 Nov 2026 06:16:44 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956838e0c.1.1794233803786;
        Mon, 09 Nov 2026 06:16:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9d6867sm171976966b.84.2026.11.09.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:16:42 -0800 (PST)
Message-ID: <a32b69d2-80e2-49c5-bb44-d7e808253ca5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:16:40 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as
 non-secure domain
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, andersson@kernel.org,
        konradybcio@kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX2gqMHwPiyVWF
 GugzLJr33duyU8ecWXqa8PRKHXUsVZvKS5qWkvgNfHVLArJ46Yqu11LprDZzubyRkciJJZL/7+G
 jnTxTgSN85p32XnhjS4oEtxMe/hIW0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX7fjZ8Dqz92uC
 EQGgosvtRQpr1s9LuGd8T4SycGL/KLrD0+Vz2vtW5UU+Qq8dHG/wgQfKuVOulyazoGpjF7hSyfl
 9/WQYpI4IN5CCQPs9KYRYH16kYuQSmAs43qj6y9yAKC8moKoUe1Cp2Z38lKQgBu+d1G6NIyt448
 WP7mYiJv1U+ihWjJBFMuKlXQooZi0hkegnr4NjH2ZKVaUObwEzYc1tt5ASrvlxUAM1HE+l5BzWI
 NV2g4WPPVRsIoihtF9LnVjROTFSX4mh6XDWyeZfwNvvFy1NpIjET4BQR96TZTWe+kOYMmRH8Ds4
 Ac3QnF8hwL+LIfwQF0Kt9+M+vjlKRrn5m7rDhdbedvzj0jDtvZKA/6Kxwpv9kyV3t3Z+30b3y3b
 3GLK+rvcPPec6vVvFAIx0cL2Q4CAPg28TR/Jxh/r9i9R8Ew+sYr7hgEth0e3msAtG3Dt0iWdsFe
 u9bUm48qdg7Gs0O1QDQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d5cd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=RWRYIkh9dnzXWyXN4okA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: LMYZJP0WHTa8hNwKtevHg2qc6pc35fKf
X-Proofpoint-GUID: LMYZJP0WHTa8hNwKtevHg2qc6pc35fKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056

On 11/7/26 4:26 AM, Qianhui Xu wrote:
> On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
> other non-secure ADSP users) is the one the firmware exposes as
> non-secure; the CDSP fastrpc node already carries
> "qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
> keying the secure/non-secure split off that property, the ADSP only
> instantiates /dev/fastrpc-adsp-secure and userspace never gets
> /dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
> (qrtr service 400) and iio-sensor-proxy reports no sensors at all.

Hm, this is a nuanced case - adding +Ekansh, +Dmitry and +Srini

> Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
> based: without this property /dev/fastrpc-adsp never appears and
> iio-sensor-proxy exposes neither accelerometer, ambient light nor
> proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
> (id 400) and all three sensor types report as available.  The change is
> one property on one node, matching what the CDSP node already does.
> 
> Tested with `make CHECK_DTBS=y qcom/sm8750-mtp.dtb` (no new warnings; the
> single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
> before and after).
> 
> *** AI-assistance disclosure ***
> This patch and its commit message were prepared with the help of an LLM
> coding assistant.  The author reviewed the change line by line, ran the
> checks quoted above on his own hardware and takes full responsibility
> for the content.

Please keep that under the --- line so it doesn't end up in the commit
log.

Konrad

> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index cf947acc57..9302481b11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2571,6 +2571,7 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					memory-region = <&adsp_rpc_remote_heap_mem>;
>  					qcom,vmids = <QCOM_SCM_VMID_LPASS
>  						      QCOM_SCM_VMID_ADSP_HEAP>;
