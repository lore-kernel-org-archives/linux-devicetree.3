Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FB3E5ED1
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171165; cv=none; b=qHZeBr3Q1UiYMMIUbLJXzb0J5TGPLXdj14ikLHSV3Mckv1xxdLWskdn0qdPiAHPMWYWSCc/H1bG3j1Grw6LtgrgPVvohlMDlJic3B5Hy4EfG+LqyoVEWjuKfxfNjVGU4fMGiGlmze2dr+uaxlKbAIf/G3hk/aa44kM5vzeRABa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171165; c=relaxed/simple;
	bh=G3jFUMyRvelI7U27y8NuiWQYOoBvFEcpd9r0zOf5wMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RS1KzaDZ5DbiCzMGWXUO35zOXXyYxMHLLebHnbhxJGYYtyqKdc5ePI6SH/6u9p3r//BfiQzABC3t4Xs1jdDVxMQFOsrMN/tZturg2+nMmAn3kqSlOCCf+QNJhwUVlwkCyGBEgnR8udxVCh2sBp39hf7gFQks+B+6dAJqZswZw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLZCajgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD7dFSxf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLZCajgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD7dFSxf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9PK7h3021163
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2U4fnm7oXvcCD0MyXH2SzwKW
	KI7UNf8U5Oy63FZiIQ8=; b=DLZCajgneOvZE8bk7b53oYZSzFoY2FgFHFx4sEJS
	MqUwM2EeD75xuyeA6ss9O2CFkKSOtO4+yMaFhpu5cZALKpFwG4NtshPS1zeeugS7
	7rn6M+KbZxLioyqqrjgPq9DOz5efwMjr1pYC8DpvsTnerf/izCFSiavPiOs1Aaz+
	WAT79G7kwicnYyYxhsBtWl3SHqJOyuX2lLvovgrrffQ3KUhefmJy5a0W68QQQq4d
	aOTc4wsNj1l6ZRRwIocS9UGg0MOjKUrebepjLKsZNUxYE5SQTxWPnJCGr0fDoYwZ
	naTEKLNXcSYtdyHFfY04TJ49ZqNUR9gCZgGL9jfmd+iL1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yar61b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:12:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93917f4ccb4so349643985a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788171163; x=1788775963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2U4fnm7oXvcCD0MyXH2SzwKWKI7UNf8U5Oy63FZiIQ8=;
        b=hD7dFSxf63n6KGu2rq1DasYnixyoe2cV9r4bGVNOszgEUXMKV/129lv8Jx2hum2gQH
         JFbAIKfLzg5W2J50pQuRseesbAla0JmvOG0JOguMpjMc55mvRG4aJl8ye/T4Dc/BnYXP
         DY2je56GSlzYIQsXwCB7ZJOl/LK2Nttgmnhmmg6vaHJEzynX74kZVfN3k0Tspwvfd3zK
         KLwu4twNFoZDPl+gzxhqhMWfkutpd85CYh9sTdCrSIZ0EzdXzCLdxY11mW96K9qxmC97
         s0Cj0RmyHPSW2pp1F5eyoSfFGC/Zo21UlS+fuTYu+NNrz+rV2Q5MAl9IEHnL32b1B7OY
         8w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171163; x=1788775963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2U4fnm7oXvcCD0MyXH2SzwKWKI7UNf8U5Oy63FZiIQ8=;
        b=cVgKUb8HZyJKI40lWeQ1YTwsYabGQFV98mxS2zE5GkVgbqJ/oC9D1wMnpxZVOA7Egl
         dZEIZtt6hO8HUbaX44H5lAYJi1zskBIZBrptIOHFBATGd9gXp/pwbg+u7a3Oo8Uhi4ad
         Yvdqn+h2eW7ce3nuK/TrZJm2lxowhhe+9gcFswxQ2NlojL3Qy6bDO9KDEE9eb7ilZwbB
         Ug70t7rroUGFRNanJBiRmnFcipw0U+K6jNIBRwGw/NSj3MaAZoWzk4cpdsc4XfuPGIq+
         ohAKLudf5+1sRs5xsf/nvynwqJ6/vD67mEv8913JopYQoYOohJrlK0HyxklM+7m79PLw
         UFhg==
X-Forwarded-Encrypted: i=1; AHgh+RqmB2Mq99CFpSyAueZT8pnStMUe9kauigXXrHisqsdAa/clVUXyqiL3V4hud8tx8aEDqZdPxi+HbKgm@vger.kernel.org
X-Gm-Message-State: AFuF++nSYSkTWkMbihMKPCLW3s5+6lQNVM9cYOwnIqqEFY7rfat6Wm2Q
	wFsn9i3/UywtYr0nul2jIzkFdcG3i2TollYV3HGzoLp6JvxHF6kc6wl9ugOg9KUbvHfP6Y2tbuy
	inbpk0gOTzVm7bd93wVNiMpJkM3WYwKKgnRt5gv9wwqHMvg1MIETy8Zkr5ilJNhRW
X-Gm-Gg: AR+sD11BsYzpwoDEKm3Bo4ZpSzguFAxeD6YQpghvgedQDaCJ14+ROPDOxfsXYtiZMW9
	wJeKtylbyrTN6aWjQHWd027AI2edmYD0BwL9Ed45cMLxbrpSJTaAd0A70kJK0ZGFkah3uNUosnF
	6ofB4nyhC2WdVxPrIq6Gk9DbQVnvuXFdhJtWpckgzOat/G3uUOoYG465jUSsfkY+moKKkyTe0nO
	PnzEXCygeePAxd4DU1xB1H4ikjTkvRrruCxznstgzERWzlvLgUzadkLuiVKAqLSnlpl9enwr9BN
	idEjUSLml0UsJsAOgHVK3xzL8n74PODRmIOANCXg5k6hl7dJ6qHPOEWQbwp1H9aVMm5fsOZUta7
	Q9OgHoT6OcGBZWA==
X-Received: by 2002:a05:620a:2311:20b0:936:d2a2:5fe with SMTP id af79cd13be357-939137b8d08mr2148073785a.6.1788171162636;
        Mon, 31 Aug 2026 03:12:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2311:20b0:936:d2a2:5fe with SMTP id af79cd13be357-939137b8d08mr2148067885a.6.1788171162062;
        Mon, 31 Aug 2026 03:12:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm113298145e9.9.2026.08.31.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:12:40 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:12:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4OCBTYWx0ZWRfX+Kqr1p+D7Sfi
 xw3bUVLYEnZNi8ZhqpPKPdPNbPAcWgPUsG9Mh9aC/05AOCEWCddp/TJAHNEXqqNwf76kI9/rrEC
 PjWGpvEWyHarBfyemWU6GB8zUGKK+ZY=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95539b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=65GQ0PBntxe8_1ckD10A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4OCBTYWx0ZWRfX+cqO33HNBZrm
 I8LisASU1+nevnBHk5lFdN2qd8VMuD7rpOjYV/yFzCKm2iZIApfxsXgrzXruSO5ZVjzVZ+vpOma
 NbWkKXpnzp6nDPrx2asRs7Kn5PO/OLRV43Uw3ZHanaYU1gzh+j7C2BoXxR9qJayJRnm31Qyj+lU
 WN6RKhP7WL11GdsWAGAGWuB+G5B4bVEXcZu4IGe5/GlNiWZ7axFazDEe5n6A30TknJNgWQFQh5M
 8uB24YqWaBJbxlBWVeoqvK5iVlxsRuB1D76jTjd2oR9rpif0+dxUdrly/Zcvl3phn/nzoLecjRM
 Em/4yKOLrCmudHyKREIrbk7bEGgF0dHbXHWZEz3rKJwGLpBnjI11LFipkB+a2el6oe/df9R0yI3
 m1MpV7wjr6OIUY6DrTqk5Qib48IwObjXmMpxhmVDq75Hc/KBI5GR5xKSfo8KV9UUKDFxGqD41L8
 xCvsFDNwd/aC2A93AEQ==
X-Proofpoint-ORIG-GUID: 7U69OzcUEKTsnBXw68spgni3WSCt1plp
X-Proofpoint-GUID: 7U69OzcUEKTsnBXw68spgni3WSCt1plp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310088

On 26-08-31 12:54:40, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line on
> these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> 
> I was only able to confirm that this GPIO is actually connected to the
> EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> recurring them shared between all Hamoa based devices, so I reserved it
> on all.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (9):
>       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
>  9 files changed, 11 insertions(+), 2 deletions(-)

Urgh, just realized that there way more that need to be addressed.

Will do that in v2, after I get some reviews.
