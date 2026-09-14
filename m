Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725E486433
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401165; cv=none; b=Js7DjuCGS0ZFdLHbaY5GXfU/J/2w92p6uMue0t3ae/K/nM5FFE0Kp37NQQprK5bd/nKTYXc1+IHfI5G/j6eIFcqIi3C2l0idL9oYxIJ6b/CxnkJ5Lfjijq8EvGzP72So5NTu/pMim6kttrWKYA85Zylg6X6UuQI8256bg2D/Lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401165; c=relaxed/simple;
	bh=HIk1IpHMIoS0JC9EwLMBzSzfIUXCdtc0LgtWZRJBnoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oC8QLS3PcYvR0HGdH+Dzo7VqH70JKlvJmrW/mCYth7+gZF/ALabvKYY/eCRhqZTUI8I5XCCcdDsNV47HLeA+jMHOlLFUbweKS7TbaWCFuK7peq85s7wTb41Y+RQh/7ubVEX2/Ld5GkysoKpKqMLT4ZkVn1yZI+I9jOYR3IHaXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpKZIH2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNp9hj4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpKZIH2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNp9hj4o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0W764157615
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1tmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:52:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so1167680e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401162; x=1790005962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=iNp9hj4o2AzxqjBfaNc5bHa7I9iqqp+Rw2H1NHRdqhrGcquWfThpehw8rPqlq2MLTL
         0P48a0Y80wjzhikYeHFNvj46qqX4mIP7HAFmh9I7FUVL4BtKg7GjNcdyJYHHMzZ0qulD
         mfSx41fgQL/m50tV94wl8t253qBLd0Dswivz+p9bsidmHRh8rFBefqhHulDrS8Qbs2TX
         KMXSDw+sBiLM/Gmr5cug4rRF8hJL6MniFXc/2w1qz3s2V+MP7YGR+y1HTYN2HdVycpzo
         dhktmN9qoB/sEhh/nR7AdODR+B7dShfkRGD6pL+2PI+Ejw4Szv0Ah2rB8iqVZG51R8Pg
         UgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401162; x=1790005962;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=mW5ReT3LinSd+gjndXGc+SlTfF17qyQYfH0+eHMapUSI0xJ5bfGMSzKw5O5iqt+OIu
         u+T2eOtZg5LxuNku0pL5udvwh+9w0PQ29pMQPOWgPid7ktmWU1Y513H2qbuTDV9hGAgK
         Y4cCPnttZHzjilNLpJTZQjlsdyA6Sk150/ujx4o1CtqHS9dP+M3xi2q7fHIEP9vzEFAc
         +98LGQDPXs0dYJIeo6skbW4v079xuXvySAefBGYy1BTwmKcQZ1bBFrqXM62B9T9ph+5f
         nNBkAOtusUwgJQd7f/uB+R+jM3duyJoC++jF3XebkU/8rHp+eabYQivEDqa0QdhsVK6g
         0+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7wUzp1TY4LfPAwRQ7zjmLj6bYYs6oO9k/SEV1pCFHN9BEb/5NN1/xy4ivf5BFD/mUqYaPtJ5Usged@vger.kernel.org
X-Gm-Message-State: AFuF++laROPUe3qwOzf4o2Xh46x2kIaMt0ZzPdR2ytIE54ivZQU0g9wv
	Tr3qLPUbfzmxtCRWiebyZACMwL8OUZdhSpA5H04TGC/DYmN036xygItssb6oaq7Zt3M55y6kX1N
	7lUSUNzC2HzImIgsnmqkjD7kS7NqAkk8HqHQ9vYKJg433anBtirtvyq4NfYUdQBny
X-Gm-Gg: AYBFou3lMtLElbYMx45lLZyfl3vkpUUJHFWfpn7GEbFyXBezeuQuZd/FMR2YvIhsICw
	eL/LNgSeBv/SaS0WCqeD4qGGloH77B7ys/cSX+UlGG33s52JohZ6JHXdEIvvtOvPHfkihFvA1GN
	2g/v+NLTogKxyw6Sn7LQ+C+h6+d9cE352a1FBkxc8DnJVtvLMWvUxYNorwKnLJVWpW5RINyWdeR
	vbR85zvI1ActIjxy+rFxLTTGG+os5LAYRrGzg9CY0wl3y2dD2zUCpfXeUs8jpTdyNgfb0YUK11/
	lFyz8TgV0//51sytnvvtMRpb71xjtzpiqT4xc0wqGQsTlAZQxg0Xb24vE0OXtn1i0mm+HWS4wkb
	L9dg7BHZo6XZo+/0bMvVyo26oAWXN
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781469e0c.6.1789401157621;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IumKaDLRBi0qLpvHJP3m95sbpyy7hhpA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX3sTl9Kq7/SaV
 Y683nT03HczB/6orF2uetye/S+urPjJAy/EfELvEQfe/I1g5M89EwMGEBSxylCPmeIu+XvdnI2g
 aAjFSgnzslcOBn3p5Nx/OWpyGckyhUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX5J5GeaS/uZHf
 bFy9D9S2ieXHqobcrX7foDxuSTTZM0i3354yRmWO6XkKwXyPzeHl8IR6h0lXvZ9nJAbevHznrrv
 7CG/dQ7LED2dvZJ3IW7gcqJvAhjs7b+9WY/KOS5KLZVRxfVomLb0jS5LYlLXDUzjy2YKSrwP2Vq
 5hawBlH7QnJSYhPKFtB9y9zzDXtiPacqJRz4PQ4gxM+msdhH8OA5xIEc6Xa5HKZkdI1wf0LAitr
 JHoCEW1mI6sPL9+KSECKV3HHJUTnhUDRwwFiAQmNKt25pRdHhdtDKdasf8kD0wod4d12/gbCaT4
 kFV2G8+vV69OAKJwfoLESQD5h4R9WycBmXLYdcbdO7DlM27fAsNYfldTB9wykmfKCnyE6WcqIYv
 rFACl+kVSHEc8RuTbX93SCW0N+alG6U8tNUm0xHDkP00Hbt0P49Cz6md4926lJwCMkZnaKrCXVu
 j7FBiEkGrAmucnceGsQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa8184a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: IumKaDLRBi0qLpvHJP3m95sbpyy7hhpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140226

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof
