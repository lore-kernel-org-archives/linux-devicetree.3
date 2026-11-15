Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776674;
	b=gH9YzmWZp+ZVREsddetD1IeT5V11zO65+DuKIZXjyaRLuh/eW6bYHO7SaKLMbr2lnFim
	 CU1pjBgVpbH5MYS8jgD7fwIidehmARBYdgYt3/SwrVya/OkpC/L5LI/qOOIrsaRxR+26n
	 9DhUxOw3rfvLDMBZnmjB3K7bWsNxFZvV7oXwKnuLRrZrts0XqGeLsBwBA2BDDhZy48j0o
	 TSGUmQyUzz8uqgE9Wg1K/Bnag4qC9o8TrGbt1NRc728o9zKTYBAP0QGcnU4P1b63OE2Bz
	 JU0+j0ulkdx6GlcGybCl+1WP6NbPx9Lkz6pTbykyyckJfOW09ixAa42wm78WbiyPopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
	b=AG3TdcJ6pD4DAyM0Vr+p3vivVcoUiKQZsZ0bm0OoFoq6KyUzYICe/Dt21SjuRSMxLOSU
	 LtEBgYN4tRYeihxfrW3viHiwlm+HyX1poazwb53YprEkD/pgl4SFALye0ysSlJYh7qPam
	 FYoIfv77SZYv8cJlzMFlW6KudNv9kexKawEMx5jAs7KBFqKB1pYJO/WhM7rl+r+YVSVKP
	 UVbS+w+FDarLkHjDxhP1DHPbVSD0Zmyu5oqPJUdjFXNv+xwqxG8Bml7GzwnA/GnDigsFx
	 pQXu29lTUUlFm6I8K5jUXrpLTt2hyEa1SnuWJCNNhLX/XbtKGE70KOctBXW3oKbUZtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oF/0+aqw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE2sUVLj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A1606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oF/0+aqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE2sUVLj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQian3041681
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=; b=oF/0+aqwESMrHQKj
	1sdeu3kSMD22w1XiSlcthjvvll0gokTqAWQcduUSGxstXfrbk2ZG6iFfUbFOyjQ5
	aTKZS6S5OXZshv1BZ5J4zAic2u9Jh4sgnyJKIYDDlpOIbdQJzKgz+jG9DwC8Eann
	z5bjts8xnIiZi37qGDud9gLYe27NQTu1VpLkg1Ua1g4KqAOiYI1QCxgQ/Q/CCl2N
	w4KDO4LXhXvFFM76iN7aQ+GAGWHR28RPg5eXkEBJTT7Vmc9W4DQ+4isg9tAuFCCe
	Dr8UdlI7QApi5P9Gsx5ig5h8CYP0vPKtYja5HcCGUlUrN81DSNoleZkw3O1HzZ27
	4cSdPw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkw0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso847342241.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776672; x=1795381472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=jE2sUVLjro28N5J07WPmzPg+d4dyrX9o7S5lYJ36+bWzIqOCnn+JAG8URCv87DeueU
         O3KgQLaR+9iHhZzfYCdLJ6Kz5nzIHa78vYBB+h0K6jwN5buxMZK7ROktgT0Wk0ILRUZg
         5d9MHjEw5+JkxPn6EkZW8WT+fD5eRZNbvrV7qLTTgIvkpvXG0lhS06SxYFpdIxm3RY4s
         lvsVg775gN7/4QNeWTcnclD3HVySas0NzGbXUwF6+uQJEDd2niWaKNTOCpG5tcNdyyqd
         xmUY2oTslNh2WaLPKQvtPVGv1c5Q/rAAu/LCMyMl+571wKlqoUFy7UAAAIyw1sktYzQ+
         trVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776672; x=1795381472;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=JtuezpkUGD1phvcg1SKaVLvSGolZhSIKPVwXJ1x/HOIjuQAVJ7Lq79eX+J6F2lNAhe
         7DEsreYPLO3DWgzhfXVIxtIQPCPA0cWqIh/cLelKobCJYlgYI3BcVvjb0q4qLroKM3Od
         +U2rPMl2qngfS7EvzwFLfqjCATcaQLg07UG9HBjUKXliNr5QfT7iUUOapA6EijLepBJ4
         tgQ/7IFf9GPQ0NNa9Eyjyx4AsbK2cPiuABrEz1ATe5LfUy4KiyIlSD4vFebjQFrbzI9u
         LlSQJ0k3ttksOzKjz2K8Ld2q3Gd4eEYS+UuSxhk+QyWC18hkGIMyrWN3vpAjeAEHWOWx
         TK3g==
X-Forwarded-Encrypted: i=1; AL+hErGzqg+sQjB8xl4Dsq6EuXqCWcYefomnVSgL1z+2VFdgT4AXP/0BBhhquY6N1Efr4LRdCKHI7omKKeTA@vger.kernel.org
X-Gm-Message-State: APuU4Z+8YoeiKY+ODULFFpkm+WOxbTuyl/VNkvA1xKPxZKlAZcs938XY
	hm5Ekkh+y7t2wZ1XJ0nA+zQrI1OYBQexyOc7+A9ryfGeVQbgX4Nc7f/pGiehfTKeqIt60+A/RX0
	+Rd2KAmgYWSnJhLZfQDKT8+4PNJaMgNT10a80r9IZ5xq/vXHrCN8vKAH/Q8V6Lnan
X-Gm-Gg: AYBFou34buavm+pYwIgxg8n7PlF5PfkrTLmwFrF1x6kFSw70bGpG4WE5gtMfdh2up74
	wLeM8eIsHJzlyynBQnVK0hylwMqj7Fkcbqy4bCO7oe3XmXDo0cMSTpVKXAsftRj7pQclUZAhmKN
	h+c6wcCvFGFbOxH7FMdDgi6QLa58qXbD73NRgB1/q15uDaPxg11UvU3VrWcuxLkZThCYkQUo7Yv
	iI7lXptfM6aTaW8Elo3Q0UPonhCO4cvjV/mNhiXuoMH5OdV8VpYljbBSG6XmPrBdCNQ/XCvA92k
	JGYXVSCwTrtHlY/RN+U4M4f/nwpkzHAmj9pvEMgVu8sjUlix8orf3UWN8HColfOK8YqyhphxW2P
	1YGsxuyWSa2jgQuXfSaVNfRzqUF8f+xOTu50KXd3Udp6IcrExzWYXM6lR0Idr+tNnXY/fCAiS+t
	2P
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128295137.32.1794776672591;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128278137.32.1794776672148;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm231653655e9.15.2026.11.15.13.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:30 -0800 (PST)
Message-ID: <e0757b36-cbdc-4282-a30a-4e5f4866cbce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:29 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa1e61 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=YIG-ia_FBqWyFDXOZ9oA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXw1Jmx5H8XzVT
 ZjhIKoeblnsSXEc7whCRhBOnBk2BAkmgC/DW9z+Tww46tACqsuODJlfK6xgt3/TGyhJY1WoQVT0
 DDTTz6wKxv7rNb8OSvZAPZRUD2g2b/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXxaDgEweNZ7a7
 P4oe+f9IOfpWg3nG8aKqNTKrJT2/jXeBsyxOu7JDzxJyoG4IDrYhE9GiaA9qldexYsm4S0ggoAZ
 I5tmkTg/iodfKA7XNCtx6JmmAmr+Uu8Oibzq/nASSEgt+wIf6BV2G+dWFz5QLuAfCOGSmJ5JQPA
 3RjGsobTT056ZT72aNMnTfwenIbQb2KauJn7FkMDBMzv3qtYkJeg+Rp/evXUHyei8tL97L75Pvm
 B8GKKegm28FixCIRZrPD11UfOgbnMo3CUnxZMTpIjN9v5xTrm+tV2tmbt2lPDtsgdNkGf/1X+Ft
 9CbQ6nBU1wJ/t/wvC/FchgYl0zUsn3sdx5ebOBSiBnXfrp6PsGL8eJTa9VEG5zovUAQRhKH7TXL
 bjPYJyKGVY43Vp2qj3TJuki3ZYWqBKY0mA648IESmgOIcZlZGe48o5zbdXCk8HhtbitQtQ2Q4Yg
 jsN+auIXZ4XRv1YMu8g==
X-Proofpoint-GUID: pXNkrAYSwj1Ya_fLv5KOHaOm2PptqlcS
X-Proofpoint-ORIG-GUID: pXNkrAYSwj1Ya_fLv5KOHaOm2PptqlcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
>> both directions, and each direction needs its own sdw_stream_runtime.
>>
>> Split startup, prepare, hw_free and shutdown into per-direction helpers
>> and run them for both directions on such links.
> 
>> +/*
>> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
>> + * to be exported for module use.
>> + */
>> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
> 
> This looks a lot like snd_soc_stream_valid().

Agree, will fix that in v2.
> 
>> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
>> +				  int dir, const char *cpu_name)
>>  {
> 
>> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
>> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
> 
> Both directions will end up with the same name which won't help
> debugging.
will add "Playback" or "Capture" Suffix base don dir.

> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>  {
> 
>> +
>> +			for_each_rtd_codec_dais(rtd, i, cd) {
>> +				if (!sdw_dai_has_dir(cd, substream->stream))
>> +					continue;
>> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
>> +				if (!IS_ERR_OR_NULL(sr)) {
>> +					sdw_release_stream(sr);
> 
> sdw_find_dir_stream() (there's other copies).
Yep, will move to using the existing sdw_find_dir_stream()


> 

