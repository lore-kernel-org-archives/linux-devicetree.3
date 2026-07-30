Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAE3AFCE3
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454637; cv=none; b=nrwS80tkiW+udEIZ7O62KWBw31wLrbtHR9zIFgF8HbjMa3uo7Cr1JHhRVYuy7d2nug6MaSZU/sbbgcqVYZMwddSwNmp5LeC+uCDP10rAdSEiRo5ej1pkc2rKQPSS7UeGZovQMqwsQmp759xNrEeLkPpiK84P8K2r+mmaqMmHbso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454637; c=relaxed/simple;
	bh=4lRX+v5ofI8pAEpVAItAgS5X5NxnSEovANu9RD25YUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NptNZgmgbI67avBUb2VRXK4c/6CSaABSJisMoiNOn5c0VBpXD4FZdrXHYyGG36EhyxiZxbat+QaxdscHKBIe6TFQVDN3zOdwXHfWwmi+/G2vfR26TFpCyVjNMnLhr97TzedwJlhBRdJRitgjqHCGVJOLBI+e1YZBjkT2GLLe/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DONNrXbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=db0TCmA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DONNrXbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="db0TCmA3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrAtU2121442
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QElqoxWPFZqN4pslZeJRYhEi
	+Ncp5rGlPM3D+WWt1NI=; b=DONNrXbzfhC/VkbFKsEz0WBFLnu/fE87Opq8jpKD
	gm0Y72aQmv0YjOKCrEOOU2JMrRKUkskh1yNrM4Rf7PyG8rhnrGwWAn4lNhYneJIW
	ICGTq+MU1ougpzZZ9/ibVPPfhnkhSIudlyMoHjzJvOqEkkFlE22uJbWHJSd3fzQb
	80RQBQl7BX23SUc6F15USrlUJE+D+8uDW+kDcuCfBkWf4qMrQmonPOukIDZAqNtK
	NL1HJRnhCOt7hTUECctb5OK4QAv+27F+wVNvo9yz6SK2FeAGR8zBLRkq9tVFk8eN
	3sDc9wO7Erx7idWamCH3rMkksWAZKJrgFJglzelqo2xsXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmr04n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:37:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso5119821cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785454634; x=1786059434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QElqoxWPFZqN4pslZeJRYhEi+Ncp5rGlPM3D+WWt1NI=;
        b=db0TCmA3P6dJKy9dKs0oqgsez8lAKRMImXV2s7hizUXpCxYveBETAbBynA6jfi4QDM
         4+EPgJPS0LAaMWjRs5PpCsEM8Z4L8xByIuGNhsmE6nkl156Y0Va6I4Kg00oCMKX6chJX
         RyqiO3fcJJumsgND895vJrxuNmCwyHdrr6gP00Yx/QRhz8ADXSAlba206koqW9524NwL
         R+D5nCmEphwkBWous7aAUrpxVMBviAXOlixnaWUh6cJn5Q4bsnIi07/TDNkeyPGP7o+x
         iS0wL+72cn7J//WBV8GUEnUkPMfAopKpEJ9D1cVKRZ8v4ICE4QA9m7ulxUVKwI9IS9Wh
         SIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454634; x=1786059434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QElqoxWPFZqN4pslZeJRYhEi+Ncp5rGlPM3D+WWt1NI=;
        b=MDfxPpgBVlfc6gxpCs29c/rCaD6NeBFO5MIxqdOTSff9mwxpwND1mwJ9VHrULEiICz
         +9rN6xLrfdl3hU6jtcaRXIx0d75tIXG6GS6P+vX83DsepL5VLP5vWc538+GZu9uC6t5n
         APV/UyXJp1/2XYIivoAEedJZNgpjw3RCshjLxadBmNwfbG6sdAE11pR9oyR47xZoCtTx
         +ZvAJ+phVy4xOsrH5pioWfOb9jX6kYT6KLsZqHdC9NfXk2ZuUE0DXlNUK0qzEjoCkXBy
         rSdn2oQA2UABaOj+zcMefJvATbeKOQlluShHQVm3PI8YRsGC8PoVyV+4uMpCIyK6bkOn
         qexA==
X-Gm-Message-State: AOJu0Yyap2mezE8Kt73hMFdcMJBOzX/L1WsNPiBd80Gi+V1IX8v/wuwU
	T2MMwUyav6NQ3BnTIwCvtE4kAo2eYTFn1rBboC5uPH7dmfFUyitZV43zuS2pW8ECAO4eq2a7PWN
	/B4kPgnr01IFfVV0PLQSzj2dDJAnOTJY/V5sVAd5vDy6hLqA1a5g/p6g+7V9SoB2W
X-Gm-Gg: AR+sD12xcClaYOSAcFS1IvI6UnpgXDhc0S4YWSIM5XIpba/+ReDKk3734/qk/SZH1Hv
	iBN+G7E2PSKAdJt8D1XkuzlIUlqX73UnWNg7z+9XevClYVLuN/KcdTkMNondvHAKILK/L3lAO9o
	K4r+6eTPutonDsHM1z8hwimCr4+MeD4vzi6ciFOooUyBaOlRoY+F4/ijGZ3E7hFv33U3ao4aRBl
	PzRizrH3XfJmr4aE7pEIdNiw0rJO/N9/r39WZeFJRLjX/0K7auO/BWyrDUNZN3zKT2PpKUnD0Zt
	bTTv6d9+I7YqkwPPmL++T2e81EO66Gx1Faywfg9+kj7HFlTNOY/R40/hqHZw8RcAEJQcHVMtSQ9
	YE00yqLpOS/fvC752QhqOE0X2hVUmByP2K7Iucy9zevOBd5K4EwBDLcDre003pamsoPyAJb6i/f
	lMidSpBrTzcAkKxQ==
X-Received: by 2002:a05:622a:510:b0:51c:147d:9bec with SMTP id d75a77b69052e-52b38378b62mr50900531cf.6.1785454634441;
        Thu, 30 Jul 2026 16:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:51c:147d:9bec with SMTP id d75a77b69052e-52b38378b62mr50900231cf.6.1785454634026;
        Thu, 30 Jul 2026 16:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9baa0dsm640324e87.54.2026.07.30.16.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:37:12 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:37:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v8 14/18] media: iris: implement support for the Agatti
 platform
Message-ID: <tokophmqfjim6f4wrpwletnpojcasnn47prkww3k4nuz6byqwq@buuvvn7ls6j7>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-14-6597c08cea6f@oss.qualcomm.com>
 <20260730155444.C30F01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730155444.C30F01F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX06vaACJtkf3d
 9BcHk76KKK9kEFbqebLQSnMwt3yhOmQJM7XlW2swzZp1RPXLFlaHC73DBveMdmx4Dcp4nJXQHvr
 4O/MwVBYm0eZD2WZm5oMrkC9KRmof03UDz79w/EJcuPRJITsoVjhOh5piit5N/hz9UJ66lQe8Oo
 YwodBvWy6XqFpyOZhL0/GPLRDDcK7qbdtwH47ahrJcXuOnvoXjNon1ynPDSZGSykmCUeH0GZgo/
 0hpY6K+rrx/I7kIMDHc3nBPI7ejbPsrezUfsJl7Igf8Jo2FfBirrkbydNvgPcw/jQbpQHdb7WVa
 iei0wwUwlViNPGgCePwoXYTVQO07MAMbPTKSuC5zCh3hTSRueIgKoHq/Urb15hsgs0D0oH2aYlu
 /zfZ9q+7YDiJAfwDqLe3yi1ohyAv2ssmQgXZj8i5bMdtOENHoUTYGyw0c4KYE3Tw1OpVviEAfE/
 Qh44eDvzNi7jvnPZ9sg==
X-Proofpoint-GUID: ClrH0D1GRuFCouZkzz9EA-zlh-LIoFW7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX4U1z04L41gIQ
 mLmG34ccbP9lvhK1Psizykm0xYn3HktZ+WI+JYN223aypxZAKa6mN7kvnLzfknXLLmJrE9UOXH8
 Ei9tTytm028TxGeykMtfZ9IvM9vAUJA=
X-Authority-Analysis: v=2.4 cv=FLorAeos c=1 sm=1 tr=0 ts=6a6be02b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=LqHTJALFuVLZQZMk1bwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ClrH0D1GRuFCouZkzz9EA-zlh-LIoFW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300167

On Thu, Jul 30, 2026 at 03:54:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Mismatch between statically calculated vb2 buffer size and the firmware's requested buffer size causes a potential buffer overflow when the firmware writes to external buffers.

I think the implementation is correct

> - [High] Querying buffer requirements for AR50Lt overwrites the DPB buffer count (fw_min_count) with the display output buffer count.

This is expected

> - [High] The AR50LT platform uses `iris_vpu2_calculate_frequency` but provides capability fields intended for `iris_vpu3x_vpu4x_calculate_frequency`, resulting in severely under-calculated clock scaling.

No, See codec_freq_data_lite, it also uses 0 for vsp

> - [Medium] The hierarchical layer bitrates (LAYER0_BITRATE_H264 to LAYER5_BITRATE_H264) in `inst_fw_cap_gen1_ar50lt_enc` use the global `BITRATE_MAX` (160Mbps) instead of the AR50LT-specific limit.

Corrected this one

> --
> 

-- 
With best wishes
Dmitry
