Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC4548EE
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920151; cv=pass; b=C6buTlkfP71x4DezovKOQv5012Jmx6o42ygnNxaeecUQonSr9JCalk38x1Wgy4LM/pKJYfELOqzCYMIrsRknzQA/OVhaYveVTqXaH7/ZhlMottrZZUK09o6tigYIpv3iykv0hjwvsX2wVoebepBX+OnSAmlShm5miSSCnctSvL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920151; c=relaxed/simple;
	bh=keGb6UVJr9So8oNY9J3U+34hFwIijybk/MBx7fRA/Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jR7Rf9ji/qt0iLGAILsVS2MUmAa1vP0Mv+RRiUlZIwD+pBrzw1VA4A2QGsEe57x2Qa2JzdQD2kHRzlcSsDdky8FveSUzOwwkqsdt59KKrQF0L2gJmXKN/esDE3BfIATU65ovqUXcbo0FOLq35n3jSD0nwGHsEeJvvgwNV+W060k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEYGpNOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P71XuRIG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEYGpNOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P71XuRIG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIwVRb4053797
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FglpwYN3DHXtSL4YMHAgwanV
	zgoIboSVzAH2SkiaCGY=; b=cEYGpNOoZX2g9te/Efl+EWsdq5Ma+DTqx1oN5j9g
	Dl6nyET6Hx4z6DGKgOSm2kXCY+jsUVTHneI9Lnz5uKBVi64uSxxRg4Ui3tOXWsFI
	DQRnrn7N0iReOESm9Q48XXuG9GyPbMsbke/UYhQ78l0byLTSsWoL/ES+QBkPsOfH
	WmygPLu7xuJGt3c+uT4/mdoQ7yx3dm9FWchV4l1vlPSMRwEP3hZmfWVYdFeftiBG
	F79GRmkyRGuot5tZujOignWqkg0wDYOUoIgjB3ZWeOI/UQeyE5FrCIYDrrqsvwR9
	Fdb6IYIaOMa7B35XdPhRsP2SbMEFmgbKXuzEItO6vAdvwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx39307-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:22:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b0aae381so67422825ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774920149; cv=none;
        d=google.com; s=arc-20240605;
        b=FokGM3GDanZ5yOE2E3oGCtnfj//gE0ySd+YnUelHMJkRaGHjRIG0LVaP2s9MR9qTdV
         ArFTJljKa2QP2NF75UbICyPWUF7rW295xSKQc9rTooBZgevstTns13zO3v5rFFzwvSrc
         5dF7o7tb5W36fDNTeMsTVr+pA2mxE11XmCofk7kC14y0utwyxbp/VF9pSD3BWHoh6V0A
         mqLlfQLfOrswdDET7jT+t7oL7Z+xfg5W63JOEvbI/5lBCdCZg3h/ZYZH3dFfW5DnCKMM
         Z3ICONhNQ1mbypzosUjLOVFyOQjh7SGYlAO3rI7vEumvNQC0PI2kgbfRUqRznWkvaCuz
         hRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FglpwYN3DHXtSL4YMHAgwanVzgoIboSVzAH2SkiaCGY=;
        fh=PIDg6ahMpg5VjRe9BjHgkspgHIr78NylxZI020KE5JY=;
        b=hdY50hH0EHBpZ5shctNdR+gjdzWaC2TJ4JlGTWG3vXyPkN4vK3XqHgNr8Y4dM392As
         +WhaVYcD1LWYRc50j/Auo1Ou7HTfx+JvVA8su5KkqcIky1JsjMHOd9I1mzAX8tNLsTHN
         H7B8x4kkv/5TplRmGvamueX9pq5+PJp854phTvwyk5hdf9WtcDwOZuSYtlWHNI08rZg/
         PEkEQgsV3j1j3+AAmyzq+3Lv/vkttLvBxk/AkrXbeNB1w0z9RlB++Tsw+fRD3hJBpWe2
         NbZOKtYUjHf9E9pYvHnWJxOE3kQ7R50mwsWqGu647bha9x8drw5REapGQ5UkLBhO2D3D
         NBug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774920149; x=1775524949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FglpwYN3DHXtSL4YMHAgwanVzgoIboSVzAH2SkiaCGY=;
        b=P71XuRIGIGppFucx/WH0DJmIhiU/A6EgNMKvKUqGRuNuYCL+q9hX/3SYN9s5g5Kf0S
         CcWdw8CSkcCwN3hl5L+u8hR0eFPLeyiL7UH6H0z33PtY2wl0Y+YWam/NAnTfctRQKwDz
         foaWYEeBfGVE5bNu87T5U35Buk6xN1r5C0BSDRJ+JqJbfLfNpbZkzK1c+fqUD1jzoQuK
         X7UKXHrrw3cPcCx2qydaOK3KRi5kFT6MJw+fy8hRd1FhNhhdwsluCPENDMtk62193A8H
         lfQr4/SjaaVzSrtkogUYACToyC/yATezSBzMJdp6ag/ayIiW/3kyqUVwMdpGCBVb2Z4c
         LAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774920149; x=1775524949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FglpwYN3DHXtSL4YMHAgwanVzgoIboSVzAH2SkiaCGY=;
        b=Goq3IjM7WCSJfcEnWVoxpQjPtkHBwwzAyuqtXV8IuP6qStH9ivsVM7qXJhv2fKrjmh
         +UEvuqr4QLOhNXS5CWDRg+jtoTY/lnJggGKpvYj+rDeJkK/ewQrKkDmcQvpMsh7oTUSg
         ne621WoZ1+a+PxrL9Ix8upqyZDvNoqfGxxDesKoIInJuky0WZILw1Mgz2K9kIes+gZ3u
         5x9wPzGXkB1vnU6jP1Vr4VrJkUK5tVqvR9WHHxpmotFjk+63bcauVTN8iHmpd/cEBIAw
         TJEO5Z7JtjpV5jwLQGm/+g0dSd5r1jVja18JUF30nNgMOPBiST/McrEB9SbFKSqxXP7B
         e5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXvlMdCEHSInWsmtd/tdP1iX+ddiv/Ogz8Ilh3834g9gOaz3nWttB9s62+pZiz0Yx6AtPiTSAJr2Ky7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3b1QYZZCP2lZdjbVIamXeibLjahuUHWJYMDerGPAx4IpDrsXL
	yajLlkMCOjjCRZTMOX9Kmb3CkyRIAROGBeU7iq/OuUFBARhW6BAlHHme4F+d9HRAY3Fn4p3aV+n
	Yp4XSNEkVluN14SE2lhVaTlSIw4GEeXbitqplv2wNlNr8CD49RCMDVDBkg/zvScm++tsUmf4YyN
	0YcZW94ElKYNPpvHIzrM1NUNeCdG3HjNwTIXkkeAQ=
X-Gm-Gg: ATEYQzy5P6EGRDFau1x5f7FRggKrmvhRgAGKwlmZFJtJOpFMccJjPwyjS0M1nhFqHLd
	8+bYl4eKEko0yv1tt23H4GjlkQsCXjU+XOw87xtNISCEw/uk6e/Wu3L7VBGBxbBZnAp2lsGYXcz
	yViK2WzJS13EHzA09ZuSZSi/ttPRXOnE1WMMGzGhu4J36GrElFvtkRzZvN40QjMSe+4Edpd4QoR
	C9ERha0u/iX5wDv8pLZ
X-Received: by 2002:a17:902:d2cd:b0:2b2:4697:78f5 with SMTP id d9443c01a7336-2b246977e0cmr104087665ad.36.1774920148881;
        Mon, 30 Mar 2026 18:22:28 -0700 (PDT)
X-Received: by 2002:a17:902:d2cd:b0:2b2:4697:78f5 with SMTP id
 d9443c01a7336-2b246977e0cmr104087245ad.36.1774920148336; Mon, 30 Mar 2026
 18:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com> <a13f5d5a-76aa-420e-a724-9b4714b51ccd@mailbox.org>
In-Reply-To: <a13f5d5a-76aa-420e-a724-9b4714b51ccd@mailbox.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 04:22:17 +0300
X-Gm-Features: AQROBzDUu0m0vxRdZiV311FDBz_K9vvLMLjO71ysaQC6-lK9obqGdVTMB9BbA5Y
Message-ID: <CAO9ioeUFfjr3Dh58TQ8EB7H3NgUX04N24OXXYijiigRZ8Kkh0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panel: simple: add Waveshare LCD panels
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb21d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=b3CbU_ItAAAA:8 a=fCAXtarhQ_C1yj2ChB8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: TZyXLCds5EnaN72IymM6yoLjmFFxHHOE
X-Proofpoint-GUID: TZyXLCds5EnaN72IymM6yoLjmFFxHHOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAxMCBTYWx0ZWRfX6+kL78okHaQC
 ZDy37JyiIWhmglsYcVABXOkM966FwEYanbZXGVyajFgleUbAYaKEkxDoLyubYIqXhJ6WjFOGymA
 kkB5ukDP3Pg5STTF4uNvHDrJgxPwjHUcHpqCKqLWhDwizPYOvaXY9ML3VCdT/QjO8y4T5nY55Zp
 lbkmQueeIUtU/3X1AqM4j2k7gdpyIX7M8pFwgiHUKrx4o+npqrGYgm9M9OdxUZ0KW3xYZ5/v0KD
 mwg42J+KF16tqngkdWjG2t3W1UTFVgcIiX81HhYGaE81Dre89m3Hcvonxw6EsD7ImxfkRQZQtn9
 uPA/jkzCuDEKIIlgXTyVDMWSDjZLU8GoTBgoIAnCxzRrMAoBGvqf08wMlgTLoA2uVKSG6BmElz0
 Xg68fjpHJ+lT5KXyqqEMSyrLyRrSe9ZwmnOHWxdfTI8mmVsKXizMkcXTsULOndrJPzLFDFs0M4G
 +M3em3++CNEgnOOxskw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310010

On Tue, 31 Mar 2026 at 00:07, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 3/30/26 3:25 PM, Dmitry Baryshkov wrote:
> > Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
> > being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
> > ("dt-bindings: display: panel: Add waveshare DPI panel support")
> > described two of them in the bindings and commit 46be11b678e0
> > ("drm/panel: simple: Add Waveshare 13.3" panel support") added
> > definitions for one of those panels. Add support for the rest of them.
> Can we by any chance use the icn6211 driver in tree for this ?

As far as I can see, no. Waveshare kits have an extra ASIC in front of
ICN6211 / ICN6202, which completely hides all programming. So far the
interface is really better expressed by the waveshare,dsi2dpi /
dsi2lvds: this way, even if they decide to change the actual
implementation (like they did for DPI -> LVDS), we won't have to worry
about it for as long as their programming interface remains stable.

-- 
With best wishes
Dmitry
