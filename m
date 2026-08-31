Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E7471410
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190851; cv=none; b=jJeBWem7hcKUSrmJQ01arVW9SsN8g9yYpf2g5Rh6W3VMU85Q+i+TGJmONHNEw9dKWq9Ic7Wm7SJU8bcUA0BvJ8PtwIQ1wQrUO5urn00JxTeARumZdSsc+3UIKtkpWC/JfC20nBYPXTu60POraAGLSgvfgRrch+B7kp0H65jz0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190851; c=relaxed/simple;
	bh=huY5eY64RgAXVLfrgtrundlD7M0VZr9YqRrfGQBYvOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkDe8aJavdpq6PzpV1UIXGZCW3vTl3lND6U2jNWEwxa7hlvUNAp+3O99/xJzEb3fz540Ur6MKBuiiaArj9ThTFykRjzArki0O6tzHcMLnhccm4+gptMPMQTqEkXZlzx+5i/FYq07Lz/CTFhpYl70Zmvebrks7aWiPNK0mEgE8N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNHXb7vI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvilV3dz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNHXb7vI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvilV3dz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETUeL359018
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cKuuSMgxM2H9+M8F2LZ7faXy
	RaK3QA/YjlRtdpAJio0=; b=TNHXb7vIWsMNX/89lhCMYKUPc8PE59+ANONQaR/S
	QqsqqMy1QuhGmLgikx0lmQjToFbNR7zJUKKiM0BljRJkkO50NqzbdcpXKwitIlFr
	bq1BGo47eitRSOY2ggvFmjGzD2nfv5f9nQB+ratbsIf7PGXA9UwKAYYjpr04Hd+H
	SasPHyAH475u/HabQW8GH/I59C95cUqH33UqvFKTzqEP+CkK74PM/awbVaFLghwS
	J2DHbTqQClwSP6Qxx1+yTWNtqRUzZ/f97rKB+tlHYuptCvAZFIgE0smpLj7S9Zln
	hvBpyfXOxara/K0mib/kfnsLRxcSu9g/GYhDsHOi7n1D7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x0a3jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:40:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ccb6102baso73627566d6.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788190848; x=1788795648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKuuSMgxM2H9+M8F2LZ7faXyRaK3QA/YjlRtdpAJio0=;
        b=HvilV3dzdqgaYEBf1vIqz26Y603qUjIPsQvRMXMUrjxNufv26rXyBJd8Kf2JhokiHx
         zf6qFE1Y3GjGYgaqhfsrnzZWozXOsJWKYX3fOgZ+gKcklJAp5Qt3PRh9n4aIv+GuqCz1
         lx6dD4MDhFHxwYrRne/rZ/Yf002o32g/jJYW983R57TzPW6b9G4VTZthq7ZNBjcwbj9c
         Msexr2wPAWTXplFACylrjWo4kfMIV7pyrkhWEi0Wkkffr5KEjXHxOK76LZk+ifsZDUe+
         Y97PghzRCbVSV3EB0r7lUWnPeRNGytNY2TbiZnR4VpM/QEpThCThIbJhQirjrkQ+S+r/
         KgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190848; x=1788795648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKuuSMgxM2H9+M8F2LZ7faXyRaK3QA/YjlRtdpAJio0=;
        b=P7xt06PblsDAgdi074O/Tu8XwYS5K8JPUiNaE4JJlh7TDbtA+ZH/gy/AlR1FHLzvjq
         c1MeHQe2zyrfeR9IV4WM5yzcQDcFyvu73WCDDPHwPXGzS/zYhRVYv16nExpvoZdOY5aA
         iMJI1G8Lp51Z/S4Y1HQNYPrV9yCD+IlveftXDmFKtqRjGPLx9sFdIB7Ndto1IgZcFI9Q
         iCi8WOErWSFBCk9uyRoBdIFgZAr1dJK/inqD5TnwCwI7CNEfaAxSohGENDWXNPS9OeZG
         fVqeHcYGFT5avc8miuSDKydY9P/orVHucbsoN1DtZaJIbyxEmWLzMn92leimmUkBHOdb
         qHuA==
X-Forwarded-Encrypted: i=1; AHgh+RqGZthtNBS7mecvjkFxebyDPqfSZZzBA5HWQG1fWGjLOC/8Zk9cVpqXmKsssp4Krci7IQ9LV/23cCFB@vger.kernel.org
X-Gm-Message-State: AFuF++kj5W1sodP8BO+CQ14ntETx4fysUasoLLw9+tMuismbD9un0rQl
	M7dRXjyWrKQ2YlU878ZwvOkmZT6JLzIro4PNX3JLZNGhF6TEQH8ZB+mEyqAzNl9RTl0RxMYvxdY
	9kNaMeA6MuT048JPV2ZwJ93uqpV78/PmADLVbhleDCeo4idLs/1ECsBcd41G15kbx
X-Gm-Gg: AR+sD10M+as+SYGNdEVSVkh3GB8oOfzC6SI/hX8AHMNpWhKm+kI3NN6v6QCq0kIe1Um
	q9rnyTjlhVAUQ9RHeYhQokBLoy2ylksaxRDq3qubfUeWzNmeIdAaXB+NbhM61Yeb9G6Ta2QcS3Z
	gHYna9gX7mz/sAczl6RfXhmvTqi3s8qgkDusL1zdO8+0dX8IN6F3BZLHieZm5lNQNfB62WUZG/n
	f7MwB1rE/e7z1FexzDfVD9VxsTBOaVYApI8V76uNvxVwPM6OZw3R6XepNLL4Vm/VM8lAc3+0xBN
	RO3CwNvp5b89oUfxh2MrC0NKIxYZcixzEzlSkJQSUV0KxuTALulc0GqdKKnLJ/nxgCf1MZJsgBP
	/E+7DjA7OEXg2
X-Received: by 2002:a05:620a:3947:b0:939:383d:f72f with SMTP id af79cd13be357-9394815afe2mr258470585a.34.1788190847391;
        Mon, 31 Aug 2026 08:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:939:383d:f72f with SMTP id af79cd13be357-9394815afe2mr258454385a.34.1788190846397;
        Mon, 31 Aug 2026 08:40:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm246034575e9.0.2026.08.31.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:40:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 18:40:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <3jootu3zmxwjoeg3pw7zlbp53xf2hx36qyrbubapobgctjxu5k@lsxaphrt7hy5>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>
 <apWXm0imLullON9E@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWXm0imLullON9E@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX2I1c3dWZ7+Zg
 A7McaFK7B2fqdg9+aRSgGdMQwXkaXssRcr40tV9M1qcQG3hDZXzBFBPnxD0hQ/cKWAdsJq7V7+c
 CYEu5gHZ3xpSaXqrkeQO9+oJU73Q7X4=
X-Proofpoint-ORIG-GUID: jDUu2vR5D0y6G8wwoSfQGSdmdUdg64SM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNSBTYWx0ZWRfX3+5nv3ndDVCL
 JVjjQ0i0AnwVybRmVooVa2qwChK/m841f31TtRTmaZO23YkKcTDXfp9O1vnX76ICL632+XVTv17
 Bu9UiSMZbEVqmDAehcWUDVyVSo8odosQtKeu83yWlM5z+firovDuy0uKc/Qe/vKGCOS4GcM6S//
 8ZxvRwj2rj4K5tO9VNmD5sKr8Wt9uS7nNxoBnuV4TCM772GC7TMu68F/vkSB2rZ89EyBpH+3fuZ
 bTCEAGDzbUcKnd5uv5PGQgl2mjORKtawUkr3K3tV6+/s/7Kj1ardNcCMq1LJOfTia0Ft0/QYdEM
 o5SFgG87t847dTH99kAdTC9X/R3NdjXUDlJgmlDxWfNmtt3Z7h101JSmHGC9jYIsldo3jZIxCGE
 sXS6s8upemN6f0mCvuxmaf0MgyYhAymN77cXD6mb3aZ6jZ/p9K+Q3P3wueos3s7CmYem/CaE17Z
 GTADalvZ6gi00wt5/cg==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a95a080 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jZhjRhsPoqfYPrMvjsMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: jDUu2vR5D0y6G8wwoSfQGSdmdUdg64SM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310135

On 26-08-31 10:04:41, Bjorn Andersson wrote:
> On Mon, Aug 31, 2026 at 01:12:38PM +0300, Abel Vesa wrote:
> > On 26-08-31 12:54:40, Abel Vesa wrote:
> > > GPIO 65 from TLMM is used by the embedded controller as its reset line on
> > > these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> > > 
> > > I was only able to confirm that this GPIO is actually connected to the
> > > EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> > > recurring them shared between all Hamoa based devices, so I reserved it
> > > on all.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > > Abel Vesa (9):
> > >       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
> > >       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> > > 
> > >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
> > >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
> > >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
> > >  9 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > Urgh, just realized that there way more that need to be addressed.
> > 
> 
> I'm not able to guess what you're referring to here. More devices or
> more problems to fix? If more devices, why would that warrant a v2?

IMO, the fact that the comment is under a bunch of filenames, should be
pretty obvious that there are more devices, especially since this entire
patchset is fixing same kind of problem for all of these boards.
Anyway, will be more explicit next time.

As for v2, it doesn't warrant one, but I was telling reviewers that I
realized that there are more than just these devices that need this fixed,
basically promising to fix all and include them in v2, if a respin is
necessary. Which it might, if you merge Alex's EC XPS13 patchset first.

Thanks for reviewing!

Abel
