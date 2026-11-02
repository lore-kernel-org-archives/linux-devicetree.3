Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603938;
	b=reIYMtpBL9EUP60cS9k/O276ac0xcM1jGc1f5JmX584o6AvHLQHscKviOYr36e4xxIJq
	 0/efKZTRVe2eJOqtSfVImfeHzF+YAXU8Xp1PXyoCNZ7GRAoKutAchP9KfN/z3C34yuozU
	 sZm7Rsh5HRworrDd7Uyt38N20bxhpFkY59xnXz5W0Nu/NlPlkXsbPOrV2JgraZSG7WJZQ
	 KpIIA9aMhuWGQIDuvPQ4pHd4LmnhLoCV9hVU1x5vos+S0/yD6OKMgAVI73gQMCB82n/mB
	 rAEjgY/9j+Q2zFUDkGhrYCqgCgMk+vKRoq7OanWU5+BUNatRnvi5Mlu58z/7glRrTYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
	b=zckExhjDufBlf2AJmUhAjvx7HlgD+aqzp9vtVI+lgEyprgkm5U9GIBjT82hNTJ4Ma0Eu
	 H88X7Pb1TseBhT5I+ajpgs84BkunvvRAn/ydJeFzNTBjrT78aoauv9hSQE+zVPhOBDdDy
	 k6jcrsEDqQOE89/v3JeIuQf34YEauLPCHhNkQK6mHUXNdpy9xP3Ze1fQA3WU6YdQ+3RPs
	 Pt/SStBu4Qn+mTi0gnYGINRpSBSiB1wDBNv/L0d2O5yns3yBsrLGR8FDTeKhAQAOip6fz
	 gHF53aRYsTu3zSQMuoT60tlhKlV4etlZ/dpWTH52hGwnCVc71i0KYViTFShNOGTJNPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8F606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC8F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24wBYn1262340
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 07:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpIVie6xF9j8ExIQhEKGfRaZ
	rPU75x2Pjf04bW71EhI=; b=kgLoo7NmGPUMf79aclnVC7a+EIDKD553uM/du1vM
	C8z9NHnE0PmvA7RUiIoeAoA1VN9msGaoTz3e3JI0C97bzFgV1l9efDDOJwKHs5GN
	Wh1vHgwqEPVhr5F5O8jlzZgSVtBGzehKrIxKaXaf1Dq6IynXubHXgW3Z8N1Fc0Ga
	y6P2BlqNcQMLMmOUM6g+EmZF2nopEf3xuSEkZmwbdAMr/8jOeKiJjMCUEPfbrGo3
	WmfksX+LjCuKm9rMTTpFGYZgmwgQqqHL8ytDKI8YK6PQklT1XpQUH8m18s2gTpMu
	aCfpWCdOgKJKbjptp2ehl3Munn5TBMt9KCR7TO9fATRlWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gert-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:18:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so4097790a91.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793603936; x=1794208736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=j1FHtjHjOqSNLuVzO4AR+CGjBnQFQk5OOVq7NAVmtK0hpIhIYwdStT6or/T4EtlBY1
         jn+3xEqKoo+O9fvVXxBHwXI6fWU1jK3Wfloo91ZrViV3V0LL2HD+nELbPbdFT4JH+2Jg
         r0dPkwWK1ywcqv4m5ivMGwzMmu7ujO0Vd2LIpDYSllKXJ3t2FJlK/1tO79JUGsh1Fwb6
         FAGtgUKoZH0CQeFEejk7X2D+TsXb1q6tlN/fOw0OsCCikF0bs4WBF2NMc0A9IwrX0MQq
         MOUQjDxT6P3/qR2SoqgbZecX8wbes3uyDGdri46waQ+6+O2R2eyThvaAdW67Led/llCt
         NzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603936; x=1794208736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=OIAey33kb/eaivAnYpTxk2lxbFXCymyVrfOyITJ2IZpykDPi9h+/ptDwwC2oiG5iZv
         tDLl9svixxcaJuWZiM4hsJk8CmycscoyIaP1rqqKhhZLaWfVAduxb19lFZuvDbUIz02J
         0M1WBvAlnF1uFGb6o385Z4+KWyrvG70Y/lEnQB69NcJID0j2ecke269tB7MdZtmrlDwN
         cYRVOkdF8lmYGPm4fnwETbsnfOMtkp5UnHpE2XR8HUsIbh79wyOjvEe6KO6UlyC678+Z
         SR4DAdWrc1RhYlXToZyH1TUbEoOrILCbXMWX34H2Ty4cu/t2i41WZImVjrVGODYFzgR6
         ixLA==
X-Forwarded-Encrypted: i=1; AKwUvBzN31BbnDORiTYMGTicUfclxdmzD82XqVEcmJCzikeqkGGbZnREBpJ4ZPDEDuH/s0NbyzSNlIzhHdrN@vger.kernel.org
X-Gm-Message-State: APuU4Z8atfzweGVagjQ5JiuUW4LyNq3Vtcixg+XFdrmJ+rN0w0YV8PTS
	knpHAhL9HJ4S8f3t8+njpH82wm5LpzgA7d9yT7Bh52nRmWF6dgomxmxNDwLRQrLw1ckeOjQW5aj
	dICcklR4wDUA7kv4OJmujzdMuhC1TDhYzmbdqKKe1ladPEQ62PwUrojwff7XOuRXL
X-Gm-Gg: AYBFou0TxHe+DCGbpv2+eM6akPlWRV2zqtr0mETxPvOHvSSG9xbvqBpBTX83KR2OVKH
	Kbl50lzo8hyxV773ZcLiDHBjkyrRb+Z1Lw/8jbKci0IPCGFXVK0HmKQ3USFYU1obZtHkuSeZr7P
	EiO0wQEw+X2sMXylAOM+fVzlx2keDbjbYPEzGuEo+sSxIqOZXBoVl6tBUHfiu4sETFTkMI3ZlIX
	R9LiBN+yqC2ru4RveNjBLt9JIq51ayVEzh6BfIDJ3/OTpLHZlgQu50Kk6P/lhFPyO/vvQuvcDZr
	J73jIeJKsmX0d2FCNnhJ1tud1iJe18oz3hUfWaQqFbUPOte7S0CGB8TCmdRzZ+kbieLsyadIwLa
	S42JzBFIf/cewOh4/0nj4nItp55vZXChE61ae3C/CqPzNAdMGAcS5qEx7RwQ/lgEnpruKEiEVtd
	jQIMhYyn8zZO460A==
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619725a91.0.1793603936061;
        Sun, 01 Nov 2026 23:18:56 -0800 (PST)
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619707a91.0.1793603935564;
        Sun, 01 Nov 2026 23:18:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm7419118a91.4.2026.11.01.23.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:18:54 -0800 (PST)
Date: Mon, 2 Nov 2026 15:18:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <aug5V-E2p5IvZIi4@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
 <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
 <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
X-Proofpoint-ORIG-GUID: dBFyT5vU4E7zRnjNS9G6iKFE298KM7v-
X-Proofpoint-GUID: dBFyT5vU4E7zRnjNS9G6iKFE298KM7v-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX0C8pZO6Qgnvi
 NjcgXZ3V016n7AE4q28NqS5qjzLgRlurRH/t0HOxz4x+7d9g4EzeuI2m8yV9hcDrckHL6N9qJpP
 hFmsN1oOmIAmQTiuA3qXnE2UJnqPFBA=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae83960 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=L378qgYTX3ev7UouER0A:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXzsphaoCb3YND
 snzbIM+9Nt1qdrvYt7g9in/BRA8OJehGA3rnoVPDfJh8B0iuASy41BVy1rJ4mTrc7LVJ6dRy/H9
 /K31kHGm2ynsh3DHC/kCKDy4Taj1tAgSNr/1rPjOvqh6nC2n2U+Q8CvZ84ZF3vB1zwzNch4tDHA
 0FP70Ta0sos7Q873hu5iXAbAiidrO3Z6j7jPrbnNBDvLqM3hJsTyNQ586dC9tz2MG2OkHuZXGXq
 HfDPAatoFgNslDVcBiG5Wgcnwz0RqaIo31UxJ1ZT01yW+UV5C/PYWesd9QW5g2Yoz8zmZN4qLrG
 6vfjqwYhl5jpD+7tP6A4rkNNKlT+gdSQD3KH/Hlal7swYnlufnXYNdyXxZk5UkodJbb5KifPGPV
 ge3GPg6WZEHRlf3uFwdA0vcMffCpxMmhBjJ2RKNV8dogHTcP2D3/IB3aSXdxxZfMKHVv9bNyyCG
 PsnETteVNzu95QiQZqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020028

On Mon, Nov 02, 2026 at 08:05:04AM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 03:31, Shawn Guo wrote:
> > On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> >> On 31/10/2026 14:10, Shawn Guo wrote:
> >>> From: Nikunj Kela <quic_nkela@quicinc.com>
> >>>
> >>> Document the SA8255p SoC and its reference board: sa8255p-ride.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> >>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> Drop. Binding cannot be tested other than build process.
> > 
> > Ok, will do. I thought dt_binding_check could be part of the test.
> 
> Since when running build commands is testing? I commented on this way
> too many times already...

It would be nice if we can update b4 to not pick up Tested-by for
binding patches, when the tag is given on a series.

Shawn
