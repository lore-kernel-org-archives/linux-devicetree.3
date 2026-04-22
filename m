Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD43EE1C9
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776884194; cv=none; b=rZwwQQurmM7es+rd2RWe20+B4zkCzIVOf212W2hyJ8F0Mvf+KdOZQnR8zTFjzy4hfejnlz7ffAov/jMKGxSASS0K7lVtUexfnB495zQM1uCJQeTMK4xwY1u4I6+9iKL6y94qfN9zu5UGgVy+qEdnwJuMjTLWntbBWjx+YKZaKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776884194; c=relaxed/simple;
	bh=oW0r30fyl77xiJxllAvgQXaExv6419NWA8lkW6Tbaqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSpzGgk/TJASq5zaHsAgDsD6V+2SgKA4oQQnSYtm1qI2W67bG0TrhAR9XbEwAamK+J412Wci2WOUk7mHvj4d71fZCK2XdZNC3noNn13PbDrVlmfTNaDO6wbxk9pAmQNb8t5/ucmqeY9Lk8a9v2Bq6LWDiJWoevujx3X5AVluLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiFftyjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilcBG76H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiFftyjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilcBG76H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6avB872740
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSDQlfPYquieSxnq9HkLMCvGbQcXT9UCSCqJ65VN4X8=; b=IiFftyjOoFAJ8qgJ
	cXVZWSxqrSworbHFUzH+8B3QxtAdLoF+OYWuT7n0RGVeAKlJaP42a9vsOLfJT+ip
	CbUzLOFY9C/k2A9Guyw/IY5fJJJUCfuSr6uTW6c7h9H+LVEu0LkBxhGwgWvelvzN
	Uwh1IHgIl3s2wuwxVOx2kU1BNohdnLnz7khz7RcysoaU1o5Cyn8e9+emjQFkeoaM
	nYenNmxoHx+5ywAIfKd5kWXWrmBuqoyUyQVHiHclqaeJitSgQ52dswNg0OJ+zfUm
	tN2X/MXI93CxsEoZ2/A5gv0z0/eIZPLKGtxc1OFuv2TBoYtg93DPuA96r97CaC6a
	C3naCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh0kwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:56:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so110225631cf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776884185; x=1777488985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSDQlfPYquieSxnq9HkLMCvGbQcXT9UCSCqJ65VN4X8=;
        b=ilcBG76HlO9g8uP9gdH7vzuN9fatNZz9Qe+JB9A6mwHFY4IuKS/uHe9YCEHxBSlUYk
         bCBF2byQj5s0KUQczJRIKTor4e/8RT6gg1SnDzfGPEJmI2SWIFS3frYEfDmGNEmpJPjm
         UlgLpvvl9KlX0SLruT6qPS3tTThtdvJxeyPbkZ5oi4tvembFpnLsuojYAEvgTU73OQoe
         VtH8+Pb4f5DLw6PrV0e11TFzm0pa7n+J5YNqfb4RiL8tdUPQ3ND1hCE0po95RlUZaawj
         FvPSOHS0XCwHvZUlHOHJ5OSVyHX+S3zEZXVLVBT5hlZhPAOi3QMV26s3AFgax5b117HT
         8Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776884185; x=1777488985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSDQlfPYquieSxnq9HkLMCvGbQcXT9UCSCqJ65VN4X8=;
        b=EdXVwMSxBck8WiWO5Gg9V1RfX5wYcFuftMSP0iV61V+QeYbn50E+Jyo/xnZD4oiHSh
         if/Jst3e+SkppmXeoR929Bjx/lHZFQc3T9sVvYeFSdpiw9rnmR+zLDlJwi671XCRsav2
         z8KalTStR4FkTMETSHnHZyj3o2CQeSHNeiSbQRxWYQzCRr19Cz+5NJ0QQo5tiadDi9g9
         DUIBb3KlRxzyGnfe61D3Cpf3EE7Ywn0MqQywXTdkqNwPcwISraB6D0ybYHTVWivq4UYv
         50ca+Zhc9LmLzQ8L0UVXyN3LdJlLJ2a0BFwYgEOC+bhbdNVy1a7ypNqVjKI1Q4+W/uaa
         fHxw==
X-Forwarded-Encrypted: i=1; AFNElJ8w2QZ7Po4viUWx9tVv4owfsGRgijoQt9l/CKtCWYvPb9NsFQ2nRQQx1FY31PpdS2BhT8Tv/L+208JM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12uLzPTT3uS3AeHIdOc4IJXCVULAe13fb65E3FC+QWxbcHXQs
	Ha4mnS2QMJyLo2N2FGUBPAoKBi9u1HJTnT8CSPFUXmX32T97zRfQQdkcFA1F89KAVscJUF3J8Pg
	uk7eB8EXcDYG4kntxJ8cdG8JDdLlQ2uBTNu9iWtaj/qbtBbqwK8v13dx803uJxOTl
X-Gm-Gg: AeBDieuWJNTF6vZTj6XhjBgq9jGDUZ7XdjKNpEd/pabQIMHyXQjmBBDFxUBEaCFbUB8
	3XE+Ud2Ok+majOOVI1uJGAOoZF1EfzgzwgAjW4WvAPmfUpDuIUXmfW+PE3rOVB7t5L5vX9JCxTw
	d91A7uWNAp0z0yG3XKB/kf9r3CSdHD7uqsOCALD4QGSuAKfDbCkQEm+zCHEigjdpxXjzYdKCzYN
	UC1+pGvJBMXsMhvKO1Mqpd4y6LF6vMzHoUMRuCMDNAGgZ3Iukqdeu+tKOZO9K49bf7TsdQAAHZF
	hCc8/bK0xfb3mYMeNJ9U1Z9lx0xGrp+q680xXGRoKvB/dYJW9I1vcFz7DUu3jrRSs7RkcUReGr2
	1FagYxTJixinUufuHSsbFOUNFVyPptigNxxc68kL25aqjymqO0UHhL3EvM7FqlYOM9sbFmN8Qkc
	hmS08KCQAjnbj2k8hGMrKAQzKQDDXkuAj6g15fJhZ3+ym0Zg==
X-Received: by 2002:a05:622a:4116:b0:50b:48de:5448 with SMTP id d75a77b69052e-50e3681d04dmr335156421cf.6.1776884185019;
        Wed, 22 Apr 2026 11:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4116:b0:50b:48de:5448 with SMTP id d75a77b69052e-50e3681d04dmr335155911cf.6.1776884184545;
        Wed, 22 Apr 2026 11:56:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc5e5sm4694979e87.27.2026.04.22.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:56:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:56:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, mripard@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        xmzhu@lontium.corp-partner.google.com, tzimmermann@suse.de,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v3 2/2] drm/bridge: This patch add new DRM bridge driver
 for LT9611C(EX/UXD) chip
Message-ID: <seno7shjhledyrunl5pib323zwgshtyhi455hzyspkhuvbps4m@qb4gwwakfww7>
References: <20260420061644.1251070-1-syyang@lontium.com>
 <20260420061644.1251070-3-syyang@lontium.com>
 <stkoeboxioodtki3nyksdglihgze243u25ui7dbyac4tuuobgx@ncl4j6l4vfqh>
 <CAFQXuNYXP1fiJtUiMb5iBL=jVXTB8HX8JLzto_eGOZvUaeZkfw@mail.gmail.com>
 <mvthlwcekj6i2h7bi5lns7ycictafjjyninvubp6adgaqxchkz@372c36cxon5t>
 <CAFQXuNZG-La0YpmHgMA-TZ2ayPDLfEvkbrSJZyW-jFCzXU-mLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZG-La0YpmHgMA-TZ2ayPDLfEvkbrSJZyW-jFCzXU-mLw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE4MyBTYWx0ZWRfX6s9SnRcJ7glB
 QBQ8X9eOtw4zmW21dcguyeGJlr9k5uNoywQaJWmhL6IU4Bz+FnfL21l3rXtc6heiYmZrGyDip0E
 +X7wBKjoZ/28ThVcdtwzFJ0K3v/63yVl/WiRhmRNTDQinJel69K/1l7MRg+K5uwcVTGBs7lZmk2
 He9YKZa0UfUg/f3MgYxGgO1XX69yqD1F2KAkZx3VmQq/qMgV+HWaBvpm7kFRvQaPmZJtRDzQI6K
 2wVejgf00fuZHRHQaxPhNYjUmDI6V0+I/JTZoQYzGo5LC1knC++JN3EyWtmltwaq/y+jfz+8jiC
 owlf5Gkj8nQK1RuzYSyXjEN1A0KII4VkU8hEI0i6Zcdsw5GYprwMLHzq6WUm4N/rmWt1tO8fMCB
 yDNqfZro6bg5u4HsrfLK7hJM6BSjgvwsYcAABGUoHymyaMywyrN6AJqEryc4f1h6dEjpgzVuhYT
 q23s7g5xS9rM0m0EuzA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e919da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=lrge24zB_DpNgzo6FaYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: gYgrUWEiBs2FU1vzZBVn4DqbTU5_-Ccp
X-Proofpoint-ORIG-GUID: gYgrUWEiBs2FU1vzZBVn4DqbTU5_-Ccp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220183

On Wed, Apr 22, 2026 at 12:41:11PM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月21日周二 18:48写道：
> >
> > On Tue, Apr 21, 2026 at 03:37:52PM +0800, 杨孙运 wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年4月20日周一 20:18写道：
> > > >
> > > > On Mon, Apr 20, 2026 at 02:16:44PM +0800, syyang@lontium.com wrote:
> > > > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > > > +
> > > > > +static int lt9611c_hdmi_audio_prepare(struct drm_bridge *bridge,
> > > > > +                                   struct drm_connector *connector,
> > > > > +                                   struct hdmi_codec_daifmt *fmt,
> > > > > +                                   struct hdmi_codec_params *hparms)
> > > > > +{
> > > > > +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > > > > +     u8 audio_cmd[6] = {0x57, 0x48, 0x36, 0x3a};
> > > > > +     u8 data[5];
> > > > > +     int ret;
> > > > > +
> > > > > +     /* Validate sample rate and width (LT9611C auto-detects but we still check) */
> > > >
> > > > What for? You don't trust ASoC / ALSA core that the rates would match
> > > > HDMI_RATES?
> > >
> > > Chip has limitations on sample_rate, sample_width, and fmt, and cannot
> > > support all formats.
> > > The validation here is to ensure that only the formats supported by
> > > the chip are used.
> >
> > Again, for sample rates, is it different from HDMI_RATES? If not, it is
> > useless protective coding.
> >
> 
> I checked the definition of HDMI_RATES and ended up doing a redundant
> validation.
> 
> #define HDMI_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
> SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
> SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
> SNDRV_PCM_RATE_192000)
> 
> However, if HDMI_RATES is extended in the future to include sample
> rate not supported by LT9611C, this driver would require corresponding
> updates.
> If this is not expected to happen, I can remove the redundant check.

Updating HDMI_RATES would cause enough issues for the existign drivers
which don't have this kind of a check.

> 
> > > >
> > > > > +     switch (hparms->sample_rate) {
> > > > > +     case 32000:
> > > > > +     case 44100:
> > > > > +     case 48000:
> > > > > +     case 88200:
> > > > > +     case 96000:
> > > > > +     case 176400:
> > > > > +     case 192000:
> > > > > +             break;
> > > > > +     default:
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     switch (hparms->sample_width) {
> > > > > +     case 16:
> > > > > +     case 18:
> > > > > +     case 20:
> > > > > +     case 24:
> > > >
> > > > and no support for 32?
> > > >
> > > no support for 32
> >
> > Then check for that rather than listing all the widths. If you check the
> > hdmi-codec, you can't get 18-bit samples at all.
> >
> You are right, there is no 18-bit support.
> 
> same reason with sample rate.

Yep. Check for 32-bit, the rest is fine.

> 
> > > > > +MODULE_LICENSE("GPL v2");
> > > >
> > > >
> > > > I think, checkpatch.pl should have flagged this.
> > > >
> > > yes,  it is need use GPL?
> >
> > If it flagged the line, why didn't you fix it? What did checkpatch say?
> >
> Sorry, it is my mistake. i will fix.
> checkpatch say:
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
> ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> #1450: FILE: drivers/gpu/drm/bridge/lontium-lt9611c.c:1364:
> 

So... If there was a warning, why did you ignore it? Please don't,
unless you really know what you are doing.

> 
> > > I see that many of the latest code still use GPL v2.
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
