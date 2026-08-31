Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D652B1C3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183880; cv=none; b=Ee0hFROsNZby1NGBArU8L0BSEv1TZG6/3DsYbgWTENXWZK0DZ4Cb5vmV5Au7IKNufEHSmlT1Gxh+qnePKDfOzB4mrsvBLDLWSz1opDtBmRyepBkPvYMM0xwxwWcE8lvsySdJcnAqS08f2CaU5X+r17Uh6lIfLlm6dL+r4V+3DrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183880; c=relaxed/simple;
	bh=oiqARqCOkMd8hSrrfA2nLUvJyn5QS3R63KdLJ1NDbv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAYpGIsll1ODR8qiPZZoE5XBdGR9sXm7lDbA+/OOw4yOpbZfsV5cjriSSAeyOSM0WCu/qfn8PCUIfyr9BrZ3duXP+xMJaMkhFwhVaXOzxI1Phv4qnvxo/pK3FIKqKjvOS9TNgDU+Tur9dqjQlmv7r/HNP1yDruY1w5SVN9BA5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VanVX5dN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di3vA9Gd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VanVX5dN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di3vA9Gd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBANLJ3862588
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6pxU5CaPWXEMftRO7XErFgsm
	+7DIruyIV8kqUHD/wuI=; b=VanVX5dNkaw0w0W/yCr/EpPoddR6A2dCxwQXTq+l
	CbdTShS53hA+qnYCwzUfWL6UIGcXaCsFWc761whQv1s83NCA4p7+e0qu24YT6fEg
	lvQzaftWnXBMYm3jZ9KEVw9N4Ytx0mZ7vhSTblB6TROnNwpW52nlXNCtfIH3nlot
	0ZrU1ytMty893LJ7RhPd5FRxX1caeUELj0KlnEqmfkK9OPUUvOVlfdch+JFYrb/n
	RbGWZioa2TfqlLx0YUlKstue2HdJkUg5FKqiL5VS/SZAOyJpalblF9ahAVM2nc+A
	Sp9ZuKdH+p4B8k7fwcqvSqAC6wTjEjg4O4Oz+YxNX8zDpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm9qwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:44:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so486310985a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788183877; x=1788788677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pxU5CaPWXEMftRO7XErFgsm+7DIruyIV8kqUHD/wuI=;
        b=Di3vA9GdseRt/eMc2Xq5k5X/ZIuMX9Yzv324p8XNB5dCbFSMyIW+sEYKXRijO544/7
         vSc59XE2sqZC6zw7rckOF9lpiPnIfoqcOwjaNq4XWLFCdxCeoGE++Ps5vVzv20GV16t+
         TmTouSp6KZ2da2ZLxinHTZUxlWgtUsFttSZEriyBAhrYbqe63/pD4Ray49vo+aExLaig
         iY/RvNlYlxF15CSAqdixQGFaMisDMGAO8Vw3yX9wFzDNTHFGzF8iOYtYk/zWOawwkoIu
         KPn+yY/6JGJKbVC63hZPQfEDj/C5lqfpCE2BKzswyWz7Vhm99+Jp+3tO6/Fx4hu0q+Ql
         pYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183877; x=1788788677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pxU5CaPWXEMftRO7XErFgsm+7DIruyIV8kqUHD/wuI=;
        b=as3mja0Fj0xhV4OHH7eCZRJY876j38SK4sYbBZDY9sk/fe4y7BdGO8IMrgoBtgkGD0
         GC+MAWGhNEZ8JqXcOmOCdOHaIQhC5JoWxXN2ShxCIoGERimrioBbDb1dCbCYTrpSDMdQ
         eTJN/Y8FHEpnFX5oIpxFmijwyhRvRwcS/UEq5aK0VQY877mn0qRkR4+PWyJ4Gr3UGTEz
         qykCJv43oDscELaa/Oq38/b7kyCokWSKbT9IB+51wJfSJV6sCWTCTV5G9fdkBH1qf/Zu
         c87/nc5xrH654t+7vgDHOcFF3+vQmyWAIF0tqsKZ3XfSrR7Xl2y+9B+G95Jcq5zicCqx
         gt+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqu4CIGaQVfMOeH/nyIo2P3yjAEU2w+LVp2rcVsPvUdlU13kuHBLQuuhFJzX5LcL7tvL8fbnZVFrL5b@vger.kernel.org
X-Gm-Message-State: AFuF++nXo3jDaLOt4/mOWM2yFzeQ0YaSaDDZ+iWWzn6Srsp8pIYk8DfK
	ru0EqHqiogBjnKFdyOO0wqY3uWUlmztNYOcOzWgghcJggwbC21zzf/27HbcLWFS8gBVbRCt70p7
	iwfxAWwlk6kDxClxvmy+3yof880qn/hDFPA/NHZNOXSkuHccaduZB3HlXEXjESvnA
X-Gm-Gg: AR+sD12iaaKos1iYbJsrpYsygjeWZLkMTR9IW1sLDbm2a3I7WCunLN8xfokaY14XFHK
	i0AhKymlt6Xk0kZQGzixp3fhXXyGftfjRKRNTpKYwMtPTZlASgwFTt9WatWO0x+nqZ5SlCbP8lX
	N8TQGdO9HC0Ch6x1dBalurEDsv400iMLm6uUuECBaqS/P5JF7m07xhFTKgX8UQy/YKKAWscjpee
	6VpWqCjgIvZBLaLjyxnTu/cRdDpjOYj7GMGg+ItVuFfIVtMptitKwEmleSgZFXF9JUmzZPQzXg7
	SOBfwEwcYPPmPOV1Rlbb9GTDJXuRU66RSBnrwpJknBjSPhYsuUCtNRzqvbF8/EBBY32c8jYt+QO
	+zPiLd4VSXiJ2IA==
X-Received: by 2002:a05:620a:2b43:b0:936:bc78:791b with SMTP id af79cd13be357-9391379810fmr3355083585a.15.1788183876445;
        Mon, 31 Aug 2026 06:44:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b43:b0:936:bc78:791b with SMTP id af79cd13be357-9391379810fmr3355067885a.15.1788183875496;
        Mon, 31 Aug 2026 06:44:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48437bdd41csm11735854f8f.10.2026.08.31.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:44:34 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:44:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>, Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the
 EC reset gpio as reserved
Message-ID: <py57i22nmumse66q6rdtld4jern3pxosadhpzlq45a253m5mb5@4cibicidkm5j>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-4-5b202de8c74f@oss.qualcomm.com>
 <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXqCFzMy=VX+Pm+T21DuJ==-28wBwSJxKzCi1NMJhBKqfg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: ggCmG9O2Jwdd8M98fb6Rgua_apQrZXGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExOCBTYWx0ZWRfXyc99LB4zaloK
 I4ATilhsInhohz2yN2ttCKKmkQj6mDlOuNDIkCJcdQ/kU4ZyUhtj7MHynknvuGcNK/pJVZhj3p1
 u7eTx9w7epdFpbJ0gZomo/YfXo8aAmQkjcTOGrn0qi6T9LX7g3Ra/KvGxty1HRo8At0GxJ7XrXO
 mcapdTquCEeOfYdfeyLlvNt5MmAhHnEJDeWjT2dhGnt9fa2EE4oys5GbPtspUgAPf8FJNQ1XVii
 7YrwpWTUmXdSOATd2E2jSXS1V6Fn9siZfdD1+jlZhuE04nkerz1PibIIk3W4g0LRQZ2JGr2249N
 ShwIPl3i6N0RALVRL08zfFJxapfABEjD0s4dtjlvT5MoaV9hBGPxBPXZdCoVmpcpnrNRfatlk3E
 B/hl68sSxu739FcjkILdP/LM0Ymk6i8Bp5Tq26wExxIRwIHZu6BNNGe0vcgHmKBJ4NrntWIQEC0
 L7+9TpkpkIbl3wxK6Hg==
X-Proofpoint-GUID: ggCmG9O2Jwdd8M98fb6Rgua_apQrZXGL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExOCBTYWx0ZWRfX4sLoFeExwHw2
 krRYrLwxyzUFzOxuBxhHUkHhQibIMsrZrmYVOgDBCJe8uZsUzmQ3QmaH6tbWJA/mOKvmeeTUOCc
 sb1JUlmaU0caaYpLVoP6kg1/e/NZgP8=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a958545 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=Wcc9KN-piPjDXZmWtXEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310118

On 26-08-31 14:00:35, Aleksandrs Vinarskis wrote:
> On Mon, 31 Aug 2026 at 12:05, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > Reserve it to prevent Linux from requesting or reconfiguring it.
> >
> > Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Hi Abel,
> 
> For XPS 9345 this change is already included in my series for EC driver:
> https://lore.kernel.org/all/20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com/
> 
> To avoid conflict, could you drop the XPS 9345 from your series? I'm hoping my
> change will land shortly, its already reviewed.

If your change lands first, then I'll drop the xps13 patch.

But yours does not have fixes tag nor should it since it is just
adjacent to your EC enablement.

This fix of mine needs to be backported as having the gpio controllable
messes up EC in such a way where you need to unplug the battery on some
devices.
