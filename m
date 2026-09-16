Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2D27FD5B
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571081; cv=none; b=jmNLbhhmPHvEdbRw18pnxNF0v6AyZJh3UbKjWA89RsQxWyHmyDeFvSCWvXFWLQViyIgCtfTiEPjyipR1dNCsl5HhN3lR3jdK/lIQ8SzTDU0ZICdcvVnBQyU9h0+56grtK9CmQpIqPqaXXhmnDIb5GUA49QVRmvYTB+elNOvhy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571081; c=relaxed/simple;
	bh=ML8IQx6cSEJ7UmK5TI1ede2WcTMV4WWb3D3JvR8a5UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lx778ILkL2NE19AK2888NLewu6KExncYekZHGDIES+TRp1T0YlzkzIm8If8Jna9PwMsnR/DHLtU0dTnnKMj8xMuJXi022F+3zjQ+7rL8+H0o7USpz014HE7jsOmL/sHEpN+rkIF4qlqW/3ELnravBg9zBB4cIZgHB9FfLm1RyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSREmy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnZxxpca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSREmy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnZxxpca"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYcmm3079196
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=; b=gSREmy6QqGpa8K7X
	UoHtXEl4UlTysmQ6XSkMpmktbB5VACXhXK6Jxt3+m9XEjOMbRzfqi/Q+MZxuGfuQ
	WDfs/DXmRS/U2QNfrkrKwTIBXsxKxDwAtEapz15N6i2+jxl3H5jkwu8y4X4wuugg
	nA7gi+d3KkPACOOaFAblt/J/tRYn1iB9yJcNVmpfZAvQV77lk++6bIPP0vyl3eRK
	a/s3RxaacqxmgVA+0HvoNWU43di4OHoZK69lGhFIxdwPW0Sg39j2y4f4py189hd3
	KeDYAtFrOm91idxKU/t8Cr4a4Mo0RvcqgXF1Qj9yUOYO/aSZXvIGH/SwbafsRkSd
	TNtwxg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywbvh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:04:39 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45927d9afd3so1598029fac.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571079; x=1790175879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=KnZxxpcaEwjqSj3WoZ03shGeEcWNLgqxki8RwRIlNZL3lzGKw8nFHjETRkgoLkW64g
         8Zj0pf/Xv6aCnGcfZsN3fIL1GWU69E8wP1VVehrRHI/uGwyTPe62mQzmwxRPgBnHYBti
         5OldZj9/D1s8yQV+7Msvrmjs+AYQp39UUXPCszgEwRauk114C57AkLwUBgmQQk22O+ka
         otaZJ7CybIaCua9NIt6PtZS2ThjFtRqIeyBxxVr0G/r1TFBVQsqUtIkcnuETUggjySUH
         6QSHJ6mjmh9gVVrnVnR2lU8BGrTG92t6qaO+MoraDHHPSfL2RiwsRY5oomX8iM5w2JD1
         9epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571079; x=1790175879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7LjCBqGQZV8zO9lEeRosIFBYfLlI/jhcd5yXML9I4w=;
        b=VZzIkn3f0i7lZHobo3RRqUWe7Dogk7aKNbMaWZ2Lo1970QN3H3E2gsbdZmnSv+nKIs
         aIX6akBgNOHoWQQWzgVveK/BmwZ5UaExNO5MgSD6doNZSZdHZl05btyR1opl6DMA4rnr
         ow8GjjQlGLXBwLVIkcpfo7CoL6FGL8rSgEAi/IJRpAKURJCpWkAes7l5xpIsU0DyGA4k
         7kMbeU+ZnjodZ3DEVoFTFB3x/SBCxkCEaOUdNot0YwuJnxFsJudbZqGwuNS1Ej8Mzluf
         +lCxTyNrHD/SPS1cq6tOpE1YI4tj9EBf29rU2+FVb7RDrj37YzZzzSVL6mZlMq/5tcMR
         Z9yw==
X-Forwarded-Encrypted: i=1; AKwUvBzI/fSZJScQfjwfO8FEO4osh2BbVygRQt8jicWFBiq1bzwzp83jFXHGcH2tc3LKXU87A5IUhM5+CAtC@vger.kernel.org
X-Gm-Message-State: AFuF++nYlL2/reooWYPKubsB4XtKtFwC3A3wy4mW4GvjBiJuIR465Dpm
	ZInBJmoL2+fY0dSCKaMJilG/gTm7r5aBL7BFIr93TSc06yPquLf8zRdBqz9nrqzGsuV6hbPySkp
	gp3vTMO/z76zW2jw6ymEvZ3DIhcEpRvffygRmXFKk9pMyDH2Hot/Z5s0GACP4vbCU
X-Gm-Gg: AYBFou00hVfZ2ZwbdA85g2jw5JInzKCnmMDLu1lX46cdfrfs+kjNf3euJLatM0Wtbs8
	i67dJ8OBe0P2bzD/o/4x0nqFwP5deDXlymiQauHnWSkyGA5tNjGEvG5jr/c5AFLTD25LOh163wm
	h/ZWxIchA571mb2NMXzFQHZeT7Kjf3ZH8/WIlQzwrFBmryni8okRVDNGhu7Pm4GR6wurecD6nIF
	expdYnVltFEwgItYivEYt7nIx4zjzb2iWeqlzDRLoSNeZX9yFv5bsEuSuPNRZ42ZWycJKW8hdxg
	Zo0HsW+6cEVqjadmAF1Bo+gHQshlOHDWqNy6TqrQjWLQEjamQr/4yy85NHBbucw0xGgWjlIxjXS
	hBGXT/sGgIp6SZXPRtx/77A==
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029975b6e.4.1789571077195;
        Wed, 16 Sep 2026 08:04:37 -0700 (PDT)
X-Received: by 2002:a05:6808:1906:b0:4c3:bc5a:e0d with SMTP id 5614622812f47-4ca4df328a4mr3029913b6e.4.1789571076552;
        Wed, 16 Sep 2026 08:04:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm111025266b.58.2026.09.16.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:04:35 -0700 (PDT)
Message-ID: <6dcb0b11-3490-4254-b86c-a1afbcd3b863@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
 <EcOn_d45L85SEZXEL9tJYp8j2B3-IIn5Ao1OiDaZsoJZOhfDjo04cEbn_YvY3I0eidZYm2PvZNw0K2e9D62CGQ==@protonmail.internalid>
 <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
 <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c82ffbe-748a-49f2-aa52-eb7a56165c03@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kMDqq1XnTuGy7WIyDutA5Haaz_yRjIZk
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaab007 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=UOiVvvBnbk-lCBhJZBQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfXwMZvJUdewBbE
 t5rlqmZRMIMVNLv7iJfGAzWs74H4LwPQqAsR/nCeWakz4KqXH94kYIazWQdkHSBkreEIemzsb61
 sH8Uq9ys6wy5+g6Ihu6rphccIzNmmmbu+0bgvfbhcfeH0tUYO3fix9zceSY30pMYa/OsjV6UmzK
 x4NFg6qGqiCMV2ZKNx5/ZrlSWHgT/ppL+zG2k1QA+ZxPZ/xDCI3UVZ0cmbnMt4nFfvcZdmKH1QC
 bDED5S6X9hQeaikPLXWCb3C9iAzD7BmAT/TDRkZwS08MdZbcAUg5N0gF46+tGOVDRzkq6R1CSgn
 yi1Myye0qi36qIpwiME1+uvmxzGfWiNW6eXD2W26bfyPBPPnHHxnAsX4FwT5+oc6P1Rxh3xG8Zs
 sA71Mu6dLO13uyAkleP5gq4wP5hXtpGjGUfFKQS/I2f3zZNPaKuZF8VgTla6ULe0S9sQMhUmLxV
 RtC/2s7Jtu0c80afojg==
X-Proofpoint-ORIG-GUID: kMDqq1XnTuGy7WIyDutA5Haaz_yRjIZk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX+pz30mISRV97
 KRw1VL1/yTAKcpJ0zAhS9yjfvMSKiqqa1S33ncl6m183BoHAYRSfqdo3G9WCfF3EMUuiIeJ7+wX
 SfzqXm0gc7ZVXNqDLy9OXgfpsI7mFec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160204

On 9/16/26 4:58 PM, Bryan O'Donoghue wrote:
> On 09/09/2026 13:43, Konrad Dybcio wrote:
>>> +        port@3 {
>>> +            camss_csiphy4_inep: endpoint {
>>> +                data-lanes = <1 2 3 4>;
>>> +                remote-endpoint = <&csiphy4_out_ep>;
>>> +            };
>>> +        };
>> This port should be defined in the SoC DTSI
> 
> 20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org
> 
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                };
> +            };
> 
> I don't understand your ask.

I didn't notice it was. Even more so then, add a label to that
port and override the node's contents through a reference like
so:

&camss_csiphy4_port3 {
	....
};

Perhaps moving the endpoint label and definition there too would
make sense, i.e.

-- hamoa.dtsi
ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
		reg = <0>;

		camss_csiphy4_inep: endpoint {
		};
	};

	...
};


-- x1-crd.dtsi
&camss_csiphy4_inep {
	...
};

The current approach is super fragile and relies on the developer
never making any typos. DTC will enforce the existence of the
label at compile-time if you follow the approach I suggested.

Konrad
