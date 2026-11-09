Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214870;
	b=J3KvjlJbef2ErNW+2S3C2xGMqqG8pHvHfuxNpgTfA51ayBmt9fNQxnTiKM/R0SaPr44p
	 +cZ+W7JgA2lol16wKPhq2j87MBWCfH2LRpdYhRjPTyuUhqq2KRLVizrnDzep3CrIZ3Akz
	 yOXjd1ZhleVxrqlZHaGRVxihTvl2R+uEplpmcgAbeeZcN3tTOW1pvL5g8pxOwe12Hy0/p
	 6g5wAlBcViZ85Vrxg9HA70LHFZNqVIswjuliTrwpPFtNNF3utBsqeKN5gDKrX7U7OnfuO
	 IgK1vpFJ0hSpwmFRLsBcHE+QO/7QS4TKI32Ob3rOjcyNbYjmFvtx0dxagIfPyg36Nrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
	b=ZB06et8AU0q2txbSsADYy94rUODXj5qttVIoxvvKynyIqPrRaN8CW0Jno8y03LDnFZtq
	 LlYloE/WuJyDYkZAWalheaG7WW5SCTDlgm30S8BM/mhag60yzfxiinhVgiBEVCB5rX8Bn
	 53h9G3lvelMFc2j5n5OryACS56xXOa/DBQY2EBqkdlYFxeQzVJwfe2NDOXxjU5V8sA9B0
	 wPbAO5/cas5XrHCqyDBRtBLvWJV/dc0OQm4x46B1umDXlRnlTxKT082i04m5TQJymopCw
	 L5MS9TMTifZXQqyPCR9wVuRZdS46KyXKywZdua2GE3lTZblesnfG0j6B509bWXGEzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwF7Z76K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IjH/UgHo";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E2606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195E2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwF7Z76K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjH/UgHo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AgCA066512
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 09:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jg4upLHUrM6H1fsgp5Xb2gkT
	8KIhNg+n3t7qrZRLzsU=; b=CwF7Z76KP0m38XRhVKLHCxvumfvreMoizoCQK9YF
	X66jwKO3Nra60tif2qVyMXpobdRj5RjZ82dbMypq4VGE5dBV4mwRVaVdbPuikw2N
	x5hypu0YtE881MMAsBptBHxyuD/rTmzvU2BfSCpgvgJH7S78gY4F/XKrV8leUHp3
	gzi423PJU112uRme3IU0/6mSO9V2d/j4qQgIpjSdO8kmCc2PSacad/P0E6q5WvBW
	EWT6b5boWa4jF259uPqRYhdbR9BIWixj33bFQcqV1BOvO2YTxzKjAypJZ8CPN9Up
	0HIb8xjDbyIwaFMlX6zEb8k67FlVw3+6Yc1cO/R+xU3wsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdmc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:00:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1704737eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214855; x=1794819655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
        b=IjH/UgHoGAdNFLfiKwSnr33AkJaLpH+dHNF5e6LruX2sEcRYeUOsABOqKhfVUDnvl3
         0qxqEypw6ZBYKYtqpVV9wTluXXJNoCWr47UrDmKdSAe8Vmy5GbgYMtnGWlFpfcnXaTgB
         J0vkCj45Rs9OtTLJMoeuG5KL74HnLXW3rxb35BWG/Aj4PDCXIKEr1MFtQxzrOdvf6Fww
         Vb5VudW17m7UzG+H7Eb7unbCU2fSV+0JwmDTvUNXBogUbcnaV02ALx2I7iAg826QC4zY
         S7xa2jcRkIJTcb6vMgiN6fHPyb/Zqt6zmnMEZhlYFIPCcQqaW+pQUIG9Ozv1ltTxb3hd
         ir9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214855; x=1794819655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
        b=1wbSFlR6h2Bz+MT0n7t8BdTyU2yBwkx+Ue4Z1HllR6AxYF1uRXZB5cvs7No22hrbdh
         9bsfZd/cG5H+gQCyLqH16RBRW7JJhLdygwh0W9xsLWUTf3kur0LK1absXsnWjA8d7Wkr
         31GY0LVi6cffC/anl5OeC6vFUHXPbWJWo0tG/afkLedfuF9wFZm4+HkOFYFbqxq5pJvh
         +ouDsITrsTMpJKZ44HNJs5AMLTj1Pf/bigSriXuyFfXK8uG11R7lOQPAZVAMQvNcZsx/
         JD3a9Mj6nHQItD4UBphiGAGgns1UnwRber359mumjYNfx257k2A4rVF1dcJtIt7pcpCj
         Y5Dg==
X-Forwarded-Encrypted: i=1; AL+hErEoEbJamIlTMqshhSc7LtxAgjWdY4tVd31aLsDG2Lqym8Qiwrw4U/QDe2LvwTLoJUV5N8dEfGKK1aS0@vger.kernel.org
X-Gm-Message-State: APuU4Z/k7xQLOqqWITHENpuXNzWX6x8Xab7npAPYbKdwup1y9IbqxsQd
	GGMJq0dJ5XthXt4rHhPcd/O/LYCJ5CEy5It3nBE1EWF0dpUMRpfNnr2in3LSOT3VZ0HKqHA/cHE
	7bva8wzjjz0IhqFEjPnmIB+CX6GhnU2pHP27qNcSkrrjC+52yRfkI6OoThhljd1Mi
X-Gm-Gg: AYBFou2G41YZl8LUQpBKpA2aGrsr4HOHglwJsNnzCNliVJwzSCPx8pN3Es+ykLUykO6
	SVJ5pvs42P4siA/LaW8cPQhYFZKxj3DBaeAaM3gEe3KpuOqFSNxsu985AN+nB6xxVx9ahq9ggcV
	uUu6Di1bwN/lVg4DNHXw4ekv59Ye+Dkwem0eUOejiT/U1+n2zDy/TNkxbwFnmUMXFR1w2L2KivO
	deGv695d7+dQU2uXmjiSoBqVxfbqe4EreIX/QPq7dKR6Ca0f/rUfUVuImBSw26tUp/KTjC8Jdid
	WGrEH9i79QrBOuN0MM4MkC0oYMLwGmUgZnU462TRplyxT2hpHcwMYsK09xelCFOGOp4JF3HvzVF
	zPdU29WO96o91EDLdHkcRae71ncaULZ6JJTwIh2C913Al5Hv7BFPf/a2K4a1pPungF0vQx3bbFm
	gxvPwpO5Xur6Es5yDgjzlxRA==
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr6702797eec.25.1794214855055;
        Mon, 09 Nov 2026 01:00:55 -0800 (PST)
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr6702737eec.25.1794214854259;
        Mon, 09 Nov 2026 01:00:54 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm10908331eec.11.2026.11.09.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:00:52 -0800 (PST)
Date: Mon, 9 Nov 2026 01:00:50 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avGLwjn6yZRqpBhF@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: rXyVrccoXk4Z2LkjhyLtpbwGzt56w4pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX//acM3JCABPT
 JNVgujapkEs3SW+RTPGJ4FTtAAZh3lz50svH6dQ7TuW9uPx2sJvE8f1hq2MjAHpqEuc9Fl+gxGO
 Ktfjzk0q9KtwWsjrCMppLioTtniqwSFz8l0nULhskzaLEqGZ4okAb/0i3Sd7cJY4F0UVIY2QurR
 vs7yK9IMWZm88+/rhKODFZStrm6/sEhXidKY6yLwQa21LdeZP2A6FRzeYF7iyyInm779Ght/HdJ
 2p0CmDwrAa5Oz0md3E762nOL/swgH4Xfx8sFPkafGzToatv3VORHZ6dq+ilGYCkKBOR5tM2rns/
 MeSkXuDzbAFXwA4/H8AtPpPavLl9TQvC+LdurcKnj2idNXiO9Qy9A+1x2lymWLgpxLPdX93ZQyl
 zuWotUD6A8YzX+LnD0KKNuDLSR6fm+JSO2VAY1Ezhq+k44DefS5AkeZMroYGIVPEAnImE+na0d+
 d4c8IJ82gm1I7PVJsyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXwU9/81Lbm/es
 dUYBIsLvFxn8hgt+DOdv4cZEOG7RipgDPmqWbQC620ongWNcySwGO5ugVTN7nABk5A4ttsONfKV
 uuOGQsdzhKyYOM7Niy8flx5/j9N5Qns=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af18bc8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNO_JpGmdzbLC-vSDh4A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: rXyVrccoXk4Z2LkjhyLtpbwGzt56w4pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-05 15:32:16, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> frequency; the vote-to-frequency mapping is platform-specific and
> comes from each target's interconnect/OPP table. On the tested
> targets, the old vote kept DDR pinned at 1 GHz within the nominal
> corner, even though DDR can run at 1.5 GHz (+50%) within the same
> corner. At 1 GHz, glitches were observed during multiple concurrent
> USB audio use cases.

How we decide which value is suitable, eg, you set 4500 here?
If DDR can run higher, and we have more stress test case like UAS
transfer + UVC transfer, do we need this value to be higher?

Is it okay we just set the highest value for USB, there is a platform
OPP table, and we let ICC choose the highest value for USB at specific 
platform?

Peter

> 
> Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
> With the updated vote, DDR is allowed to run at the higher nominal
> frequency, and the following were measured (not merely projected):
> 
> - USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
> - RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)
> 
> RTD-USBC is the round-trip audio latency measured over a USB-C audio
> path; lower is better. Note the +50% DDR frequency headroom does not
> map linearly to the +16% throughput gain, since throughput is also
> bounded by other factors along the USB/DDR path; the frequency
> increase is necessary but not sufficient to explain the full gain on
> its own.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v2: Added Details of targets Tested.
>     Added details for usb vote.
>     Added KPI Details.
>     Dropped USB AVG BW vote change which is not needed.
> 
> Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..3a19385969dc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,7 +46,7 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
>  #define APPS_USB_AVG_BW 0
>  #define APPS_USB_PEAK_BW MBps_to_icc(40)
>  
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
