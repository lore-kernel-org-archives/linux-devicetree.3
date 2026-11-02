Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629212;
	b=0fM8KjaeekTrh1OA60MMKBIv5pB6z99fTYJsthKeC+6alLdh9wnh6oQYq4u6wn+VCQjY
	 6we3Q0qafqiWV6SdO2+CfrUrZzhRMkFzJbS2rVKNqREBWwKMo3vajhQ7e0TPfbLa2P7Im
	 gu/B5PZwVLv3RaLxDGgXzW9BHPyJzsToadbFYuz9zh0vHYJL8CoFrjSfwWKsRFY/G0OqS
	 yffzl8DWEFz1iJZIUCGELDpSb2Hy4x1K/I9vRRVRKYa3u9IXribU8NyHEU7oW8xo6yK1m
	 8JldFx0BppbUXRGOYRrGLoNhfLH1EITuhE+5sqHxNR8OtknPAe9kxmwmCdqvI8+iOFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
	b=ZK5xhB0454LVG5iIRDRXRCVDpTA38P7G7dfvXhWvFlcZZgWXs0k7nUTnb2ddiQVlKPkx
	 AKJKQHrgEFBjFfNulZxV6FPC8Yq0Na59yHxRAf1RCZjajjZEDiM4WffvPH8sqJ17hRI6q
	 wW3wKrSg+EwmNE3C7OhPx9blSax409t0pwXYNBJWcxDEK7MSNTfU9/zizyUNjLYqhhkgG
	 ofydkzmjZ4xvIbHkYAB0Lf1bgd5h7p5ghlwqp5DJg6PqQFXXYRPT51AY9V2k31daPjJAB
	 /0VH7Gw8CakbDi2QAQnxS7rPQr8ZnLi8kso46I1NyMsiFHrydlcrktExNrRSLdL/+cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a9G/cKrw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42E606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A42E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a9G/cKrw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRHJ477106
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=; b=biKAKHmgJPbtOesS
	VIHTIvQNfOcIFSdHRQFV6umd4p1Iu7/i+cPSG4/LpJAPTkoDQs+8H70NKarRvtKP
	WycNWus8JJ/n7Fl4J0EBmMHEgDzpBRFx4Sm6bcYOMCGHo46K/N32qzmPj6oB/79i
	zUl1K7rVlJre37xjRWTGqIpepdXXix3Sr0FIyADrKErJ8mqUEJlfvHjhkFvsndJp
	wfUViHEcAI+PQr5gs00ga9MtM1/xGn+Sv7emn8Lii4o9GfyF17eebPctMGoMoZ8M
	lTxjWb+bcIP8VPFdjAYIJLm3FmbTsdp/HQ4Buv0TE0oN9UpE7Br0ymQ1lHaM5WAb
	iwGDgg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19g53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:20:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so165944e0c.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629210; x=1794234010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=a9G/cKrwj2bENTxUkn0UfWgID8aDu23GrA9QWXqccWHea72I4oW+hOWWN76cPL/stM
         XEatI8+rQP43eVJJl75FDL9PuPY55ymZkcqPCOhbCAFCCphamn/os3WoOnKZg1/f+FpL
         LmizJ3P8iJWBBKNV6v1YsZN9Zfv0spmNLXP6TyVh3PiSUdJkilkrnbC48YHT/1JtbYno
         6JKehWoQUP8dkI04RM21fOEs0JkHGlWX1MtYN28V9FbLVHmaXqUxps8Zzt9uHp83ElM2
         7asUwM5hxuybm+QfdE8N4fqo0xhBWgsmKQ+nFZUWIhSHtDitkJqlwxc8ooCAzvGVMZc0
         Jpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629210; x=1794234010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=vwKQLWDVGCFx1WaJKugW4bxgsXa8NshCzpVajZovDnaE9AqinhRAu+ksNXrJUHzzNo
         l0wMLPEaE3eI15p8CL7z+YqdUsMEhm828sXK57xSu//4XdVzDUxefZuOEC5WxFkzQcoX
         VEHgQHU8tzIQ240xMsuXwslmWDPSloE+26VKwqHQ5kM1ytcsZu5bf4ALTU1/KHueoOU8
         pHW7LqxuKC84pUkenxWxW+bUZSd+MEzcfj54hJaydAOaAECRtoUXfMSghhL3uPv5IwOw
         DyViwBpmhvh1H5POetC/jG2qWai6ypmg/Esp0tsTOCw3W2XdZDiKO/wf/iC65GONcIVb
         k6cA==
X-Forwarded-Encrypted: i=1; AKwUvBy8ePR3DVeVfwpzQs+oKuqWGRTpfqefzxPVKhJLcuX3gq9NUAaXF5+Le90mzwGVrEJchq3k3JbjyVnZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/bsyXVZinuHTH4Zb/I8v6qqEt/RFgFLdgIe1Tlk5hi7lWzAbpD
	lQHKr02PrrTut2CqlC5pNc7c2xeKymExxf2P+1bf22x2ttxCFa/thCJHOLHIc20CS2Boqc+QdXZ
	7NeCf1XK9g7c8p1j+MDXBrqX3eazCgiPYd8TMy8cpuww+aKXe+XDlBnhTLeQ9ujXA
X-Gm-Gg: AYBFou1VW/BFwOZE7DJWCv6ze0P1DENcpHGN9f3tNzT0gp1+Cy+stMhFS0zsZg693qI
	K/5YhMpXEfkuIDDdh4O5LS7GB8YpTKsRbCVurCDbMTEQFiesKPmjIXvQSQ/PC8sOkmkK3Wg6C8c
	f69P3Q20CV2HqoQsBsRiVcZuaa/451cCz35n1dBOxXOO9mHurPzXx9l9JUIf4rocZSH9zKeEFP7
	njB+emJ7D8KJ02kY6V8fJ//+OppoSeLvWGfmz8T/fsWfa5dlzAj2TeezcURre7kVHFHltgOncBl
	JLythx38iDm1oIZJaLUbUPWdXap1abxjimDL5Xi9VHL3nb+vyMLZ49Nz9C9zEVJNDDobB0m/X5w
	4yAeptBebicsptit5+PtPzwvpa5IzFMgPwFeKGhBFvrap6TWREIqj2t85ry3hwhwu/B/AHSwlHK
	nVJwZ/wO5LR3hpkjERg4iAOKcKF7acZg==
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385895e0c.4.1793629210408;
        Mon, 02 Nov 2026 06:20:10 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385606e0c.4.1793629205094;
        Mon, 02 Nov 2026 06:20:05 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm398767166b.17.2026.11.02.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:20:04 -0800 (PST)
Message-ID: <bde94c6c-1119-4bb7-be7c-a4772c6d0a6d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Add dmic45 support to rb3gen2 vision
 mezzanine overlay
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mohanull@quicinc.com, quic_hbandi@quicinc.com
References: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NzUE-Q1bbNimf7D9pupp8GbKy3BgBI36
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae89c1b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0PPGIIIRtHnt8ZtJf3AA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: NzUE-Q1bbNimf7D9pupp8GbKy3BgBI36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX86TeU5LGNXPF
 nAAP7thpkZO57Wpmjlv7pEy1H7oK06eS6kT1VfUwdkcXkiakAM/kViItDk455ZLXL/05J///CN+
 GJod8GkZYymSvKJwjr93naeLCJwNRw7cuh72q0jfIb7KKjCYluemRUe6JOF2n12FSCTefsZUkbw
 704PIYpvGbWWFQ6OwD1gaCkYAMg5xK6R2+1x9U36cZRCuq2EQuTmsaCAIknCKaXvqcYawDR4tbf
 6AoRyudUxI25m0ExlQE8r748ASPX4rONzncp8rc9CSG6Pbqyo1daIBb9nZSCrgL+C2zcNK2BpOB
 SxZfX4X2HurjRUAWnazzqheEB+2mzWTtw5bDg/EV5I61dhPVNe9IymkcyRxyl50Rmz6Ln9HkQoD
 DKAfHjI4ay9wc10Ou5ExO58Eb8i3P9d9DAl9f6Dk3UBSHRy2YXEck+X72j1nOd4Wv7fWbYwHG08
 CRm6l2lQkDVPdKgSfjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX1nxPJUwJ5jyY
 uMEx77yeZkMW/kBcBwtt+vqXs2QURF5p8RszWrWtaNl8/WzZF7wGKZtMaxJPGcxhAPSMRyJVGIP
 Xupv+gjOV0M1w5H1oCEC0YWiMKaCdm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 10/27/26 12:51 PM, Kumar Anurag wrote:
> Add pinctrl states and VA macro routing for two additional digital
> microphones (DMIC4/DMIC5) that are present on the vision mezzanine
> add-on board, mirroring the dmic01/dmic23 pattern already used for
> the on-board microphones.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> index aceafea45343..0a4e6080a2b2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -80,3 +80,42 @@ cam_mclk3_suspend: cam-mclk3-suspend-state {
>  		bias-pull-down;
>  	};
>  };
> +
> +&lpass_tlmm {
> +	lpass_dmic45_clk: dmic45-clk-state {
> +		pins = "gpio12";
> +		function = "dmic3_clk";
> +	};
> +
> +	lpass_dmic45_data: dmic45-data-state {
> +		pins = "gpio13";
> +		function = "dmic3_data";
> +	};
> +};

This should go to kodiak.dtsi

Konrad

