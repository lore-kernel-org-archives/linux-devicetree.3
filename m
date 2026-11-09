Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236953;
	b=GVeCMY9SusHtKZo0r13C0wjl5b/723hR7Ex7QLwkFhB1S5SFZ3giM/I8krXqhkMz9gro
	 8WY4ComwI5MlJCADfcCfIz0LGRV9HbXdz6CnUIj18yMqdDSgGze5gaTl+0JLIMMbusjyF
	 bAamhWERbF6NPyWlPpSWCsPDsgVrNIaik05AYrEJvA+rjStxWpYGt64r6m97Wx85kk/0T
	 bAPTz/YcEsuW3g3pkv6AASgC153LARYv3FHN+ZOVu64nTgIKsWv76YKm1iz1ON68l+b2A
	 e/Uecq4W5/2Q5fmFygLL5tdbViXo8dpQFhmCEn2y0XQZOK0etEc0xwt4gBQOAhfnqkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
	b=4WXokAVGUZcOYHwDITvr5svnsTiJFbFKtDBldWangnekutCoX6bnOgrzu9NeG99EKRl1
	 07wubCa3iExr3QjWJ/jF6/7aHhZTD0NuS4DaqdiWMNZMZPydmpwY/QLzdplGPkdi7WRUA
	 ESVsgMVDt9CDYpvJnaTNsR494QqFIw2MDdzw18zTY6/9ZfP4hYyIGCHq6yL/4O7ccdDPS
	 cbRtHchwGuQigMmuyH/8POtKGH3b1d9cPz25AO6g47+Hs9zw7ihqgLBHQ1rGJX7oMKXlY
	 J5ufUSGcn20y/KS2xST1njxhARLMONIdLotmkF0jZxgIfaKsviUc12b4O47T1ND1ECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DC606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73DC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEw2b1323043
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=; b=FJpS75TcbFrT2OXs
	WOQoCz4KVYH4VtPyWb3XgVtnnZYhuH/xQyvuynyDgW8DRbEydPCIrrU3PeYCGqyQ
	DxZND5wwIWScDrn7IuLdpY5+F8SW9xsjrMq7bBJNhKkuWzmhtFusqx3FuwSZCj3m
	iAqm/lPA1m8zsIZb1llxHAJdqafx5MNhenBoeuupWzA65/tTJLfuF4JtU3/LTv6k
	22p8k8NTBFjNh8nIYlhXwO92H0kqaKoERw4FwJ8pqTVxgt+FyrUfVcEOfpduGX3s
	BY2F346kz78huXeLEPmo8hSek5dueqtxxkrxnXe8FnDeusm2bifiMOUZD4XFvykX
	5BJJtQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrk2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:09:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d1f86515so34028137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236951; x=1794841751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=clWp1fF+ZhrbDzREMjnU17D2ftR5MNABk/FSmdeNvgMWdwjEvt5VR1k3WVBiB5m9Bd
         AFVRfCvbmoEQXwASMfI07fp8SdHYwOjYKMQOfttSkGf/YXQ9rBw6dAjy/cii7JMwnzaM
         QPxc7p5mCIvDiFaGvNmZQR6HwOciV2zikHT4SX/nVzcF85zlJcZgJo/K9Lymwc1vzgX0
         k1/tbL9NJlCAPLXELYEr8dtLoY3LdcQ0AL1GdMKl4bmh0as419PufnhE7LkE5akngFRs
         MZ6r7Eir9bGX9sijbOc/venRp7kpaDlH3LRag4vK17vNGfSXhyt2TnkH8Pl9PUXejpBW
         RcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236951; x=1794841751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=FM6ZerEs8P8CSnyDMTcqeBSNdmksWUeTIkZa1F1IjLKlpJ4dIeFBwIPjf14Xiq5N5f
         uLXWIiYJsXGj+1KhcSAAQ/S8vLiBf1h/mImgXfCXF7WIKRU6wl3s077F3UpNyVnYVtOF
         tRSwj4+bQPX3KgEGg9+Umzlhz6sUFq+Jg1wtImKKZsOVWn1NFZppWwhYPRANYI4JF4ur
         2A6UnVrzr3hj4cSovwhIaELlouEImu7dN+/GO67+BtVQSnvAowihktn5EIrD36ldjxCK
         GwBg+I+29pjXAub67LoFCSDE6gISjla5XMh117cLQRRwRM1Wrz9P2OdmzSrtV/GNJ5jO
         BCdA==
X-Forwarded-Encrypted: i=1; AL+hErH3WRlYLxKM4qPkeLGfl8D4XIHL2ZojOI7Ce8N7NFbxw24M9RCQ7R5V0nrYxbN9KUrbneRaDbiQzLUw@vger.kernel.org
X-Gm-Message-State: APuU4Z/9SyUjB9HyEVMed8/Dn3Bw+/2zQ8wighRfduA7qkJuFhEy2rzc
	2A2XQ+jzOsSIg7w4bsO9PVXPYimeQPVSYNCX5jSjl4ixE0x3QRLq37gS7jJl/5XRIQMacoJdsjA
	NifgoCTs4ZHJv+Z0hrJvbZBv2SROMpTy0Zv6YTHodThrE0I7sHl1lA+XolSEjBvMhbZM89qs9
X-Gm-Gg: AYBFou03tYjmM0+k+5mxnZfo29kHYXclFMV7emF/hRBJopA7UfLR8nCtWp41V+LYm5I
	ki9NtJ776cbFXntRynnekOKkR2w0/g32iucx1NwOVIzj9KVjdYItxJw5Lm+dZXSdill+Jc4khKv
	e+aKhZkDgOaNsC2ieDoVHi62mGvHJ37wqS/rr0LLvg3CFyfWgkN+f4mx7PuJQweJhigvRmF30sa
	7wnUm/jgt33ITAjjr/OQk+fA4g20wGoIquI8gY2W8KudmPnWkUi13t6vZ0ugeB6empioQI7JKqJ
	/FYwAPjsXjDY0XKwYC2kttwlRsfdVgW0Le2aad1ReZUxt/VU5nn/rqyy48e5/K4pzU0kj7R4RmS
	dsGw55F03pIbA+YEFLGKkdJyUckyY2HvVdhzbnMvyCtEzLF0IbbAF5GzhA5TYc5lqCLNMxA==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087420e0c.1.1794236950729;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087380e0c.1.1794236950143;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e5esm185561166b.33.2026.11.09.07.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:09:09 -0800 (PST)
Message-ID: <f84e83fe-2a81-4efa-b5cf-c458531e3677@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:09:07 +0100
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
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX5a2r29VhWE5z
 muHDhwsPolkhEsfTUGE0r7781RMLy48+dgs6F3/jtsqvRRihVZzKrlNzi1Ke0q7DZgvr1f8oizR
 qI69hTkfVPDG5t5xF77e9t1ypKOl4Cb27u79Rxl6BLH648Ff3MMUWsMPcwNT/BMFHvcGkX0hJCz
 N5gVzVcyGKf/tuVK9uzxDAiV/oGSa4/1Axmi5t4UED9Dif7LM0/j5FFL2S3McDlcuzs82WWwdAm
 Hrx8Dk7SxmWWSm1GxLXs7uQZxQgubuaLodJZdBGCVwLtHytEor6jiQSzmxeMWJQNSu5LcSgV0kH
 v4pI99n6rIq4EVdIALY+O5W22ChYo/VUjWOtE7Qws1CsNcB4qV1UtaG44TMoZ8irt9ivUpYpuZD
 BbIvJ7MGvG72NbaxAcdZ5/1JOSgb9ghlDmrJNKHnZ5krCcGmAjTqjFy7gGwBLyuwMUeZu+tlPds
 7XBsfGtYJPfDGhg9F6w==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1e217 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=amEjgA4fUcSruvVDRsIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: OlEKWccuzHE2UR1R6yAOpWKn0AvsQqwC
X-Proofpoint-ORIG-GUID: OlEKWccuzHE2UR1R6yAOpWKn0AvsQqwC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXy6I4PGkq2zd9
 /0oZp9kbnxbAmDyju/dXiUjKf6EYx0i/v69DuQb30gPohVWbJosK3rYvlFGz9LYhl1RNTOVYQzx
 bon3lVaIOY4iTpnENHYsJ5PxYAoQuzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/7/26 6:36 PM, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.

Oh.. very interesting.. seems like these are used on SM8350 and
SC8280XP across the board, including in GCC.. funny how that
never surfaced for N years

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
