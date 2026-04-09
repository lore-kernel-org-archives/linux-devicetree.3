Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD989256C6C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 00:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694930; cv=none; b=HoJ202OFIpSg03HRWqUQlt0vipw7/ITxdXunRKiGCjr2aKkztGz70vI1ylHXJGnZ7FRpHvC5XDQJ18EZSRoZ2mTUo0+E2Jr3Yz03JWru5TKNPTSZutstVNVJfrg6c+pccB5JKdcTKUT5nsKc4L5snsKiNUmlK4r72av1osx6cDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694930; c=relaxed/simple;
	bh=x5YZ0a28grm6rYM42xvMowqABjBiFu66fSfwhYVWX5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMAE+d3TS7UIKWkKllbK6p2YhUq0UqmqsPESq7XnPC2eiy3VPyxgmJRIE3OppY896KlwqZ9eKy4RvzUYjJfT6h40J87sJa/npV/Ml0NDCTwg+Nno+BgjsElDltYHO4tjy1q+WAzPe4PfqkRdv1JkvrSwWazZE6nkfYIezcKprs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTcA99GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwKZa1Cd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTcA99GH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwKZa1Cd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638KwOMX4107703
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 00:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ndp4gTNtatXVB59GvfySCe521WRxiQSj1huYhg236oA=; b=gTcA99GHdSXdvfbL
	NYLnYFsc+gXA5uVq6I3GeOPWhKaDUuQz7yVX3jrt6gZP22lzRKsM/zfomtB+9P7R
	+aQTSWfpEkCoiHQ8BEJRQuNcs/eDpeIDouvLmG0UzTUsBnA6+IjjJavWByIzwekv
	OAtDSjnOPEMqpxfcqX8s4FvuH9C89AQ7mx12tU2scK6lp6giCT7Wa41CS4WA1gXw
	6JpdeM5H30UEh6s97HikDpNsnw2jB/0oaE9xZcfFNDzOGFkFCzl7NCRznccylWU0
	bBpIFFhhbzUTojn217Sp6PZyZB+9Q9KbU03QZuwEx5O1ByTqjZx7+nIFW06MdkAx
	xUjEoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhagj74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:35:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso17833931cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775694927; x=1776299727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ndp4gTNtatXVB59GvfySCe521WRxiQSj1huYhg236oA=;
        b=gwKZa1CdQfxztoMad3XlPwKGxD+jLVgvHhpIjUXpsOBbotJPJu5YhTrFDLR37lIGdw
         372LGbeCEcpAj8BI7l62zRv0L734ALIdN+6CL9hDqyTKK2+OXgmdafzCh8+ipe1vhcyk
         XdbPy9xTFNQGZ+zHSqFMQj4d8Yiodzt7PLQB0kgkl0O8Py9J6l6AkuZB1jXgtKaURPF9
         tjWNwsWQ2A/R1lb7gBcBP1UFgncGIZf2U3ccgyC2ej9EZap6XkZv0IslFN2lJoo15zjC
         icB7ETaICY0mAiYLGWvmvJxZ0RiuaBcuJQzhsaTg92SPls7Hg0ArVnzczcXItvCK/ApB
         YKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775694927; x=1776299727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndp4gTNtatXVB59GvfySCe521WRxiQSj1huYhg236oA=;
        b=SJ7pbJLHWRZDh3GiLCYfQr/NnUclbu5kqFuw72nOlnam2aXZrihuPoPVkk/4NmDZag
         w4pbhWJ9Igv7s12IFHHWWfhXYLlc26BgcenX79S4KSf2RpJ1PS/YjEzQ0MqSiNB9ukX4
         ZOhjMc3I/f6/qAynBNDFpAux75fRAD2zhfF9tYIOhdflTFGDCl76ikHV7meVmYwfZ6He
         aRxV3ClzkSw6zwT6FC7vmhHKpNdoAu5mYcK7MbM/IVsLqmc0220fFbCuR50IBy2F+CAC
         bAi7XqjyMEtrNls9/0Ja4jWC1jJR1KNx+UhnPJ9nNqG0E+QOTVECIf/VwYTYYdaNFIlx
         qQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlXljwoQI7NkJ5JV9qiC+wYLlIuNFU3ewLWV/vZLEPbw0DDg8gVa3eUo8EISBq7FDR0NStpVH6xDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxgaWzcRhUrrJRqFa2cAI0ULBBQ3A0Y9KR4xGXfctrhdSTihBwt
	quTnzkgiHkxSDY8Ny6bYL9psTky27ojTfmM2YYIHAD57otLxZrghuPvpgZTQk7Qvf+uF6ZcYYjQ
	YHNXZGdnI7WJXaZw+14DJn+gIMTcSjyg+ldy8Oul1jXrpFcFWzPEU8Xc20S6BhgTA
X-Gm-Gg: AeBDievMrsky9Tb+yZY5TgIaVA+vFB65MmjUbFyRizYLVev0Y0O6RocQZMEeVv5ONrR
	1tEl1gvZHcIfOdHRFf5IrMHz0s7DYf5/jNVU4ew6E1oticUdRH/wP3ufe/IC2FF6i79QtMVGeKM
	WGmWgUSOGyZwnevsDlwdDikJBJ1tLqo9/tJhkkJnJdKoj+yV1uTHp3N+TNdNxCQPjsQPziztH75
	xz2P7CqN3SALvwaL4tRo7Gq/+WsgtNFOZ4OchscJLMpYsb6QF3xb2+A1wWO0UkGT2DCxQhvuc7d
	VvxGkcft+URWnYL9GqGKkzxVq4PMtIGovRqRBz3PUP1T87wTqa0Xxuto7kPaOAvzsK7sw6+twOj
	xZWwwapQpoYVDKVVgYL2frlNTL4D4Kn3lKtccHHtrM2F+kFXjHg9tOJSgqwi8vUzmOMfY2cPzR8
	wq0c39uCKrULsvu9ZFMslPs54X7sPTtCHzBQY=
X-Received: by 2002:a05:622a:1b01:b0:50d:9e69:80ac with SMTP id d75a77b69052e-50dc21f98e0mr22602501cf.28.1775694927126;
        Wed, 08 Apr 2026 17:35:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1b01:b0:50d:9e69:80ac with SMTP id d75a77b69052e-50dc21f98e0mr22602221cf.28.1775694926707;
        Wed, 08 Apr 2026 17:35:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f90sm5240187e87.49.2026.04.08.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:35:24 -0700 (PDT)
Date: Thu, 9 Apr 2026 03:35:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable
 DSI configuration
Message-ID: <66643qwarl7jj663wlzpxjgviyzgpj2b56ixuzm3mb56yse3yo@qgplpii2ucfk>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
 <CAD++jLnAaUzHun-i7PBLzFQmsKCXXfRO+4hAgTFCZtLm_Bu6iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnAaUzHun-i7PBLzFQmsKCXXfRO+4hAgTFCZtLm_Bu6iw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xHoGjL6X_FdL7KFN1FS0xH73GJhBOY-O
X-Proofpoint-GUID: xHoGjL6X_FdL7KFN1FS0xH73GJhBOY-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAwMyBTYWx0ZWRfXy/n0EyRx/h3O
 H5kEIR6Djv4q0knDneK+yCopBQx3+rQfJV/MeE6+VLS3Iv/CSIGElJ/G9XJLTfiASY7LZ9SDe4p
 O+0R2vSwydPgtbVP30u8BtIG7oD6Sd5VfJbEL+WezykWD7pufsG75CAW6qxc8LSpexZP/JFWJgf
 1V8T0zVCHIRIrhSEbdirSarOrQ7LrnBjMXhR18CIMYylbcwLLEwUdo2CpSuiQsALhq6DRzpsRaG
 zU2hKALMM1SM4RZ/+VrKDMps07HBwqB8mPmrk65zauHIbFwnIIFxU8ZHFnMvbzxUllPfkrPWgbM
 c0rTWiTq286H2c3J9dh395Dhzc8rmWumyOdfgvDxZPctJxBqCS9IAOPvMN/ucOOLvG3qUqW8vfT
 vo/6Gf6HBi5e0IB+I4A2SAZOULxz60gURJKS6QFsivqjHQkD8A7Ri33I5ooUh8THsgcev2UPxX+
 DpiY06RSm6YCOzwxMGQ==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d6f44f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=yhDMsVvX-kmwEEQif6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090003

On Wed, Apr 08, 2026 at 10:15:13AM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> thanks for your patch!
> 
> On Wed, Apr 1, 2026 at 9:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > Several panels support attachment either using 4 DSI lanes or just 2. In
> > some cases, this requires a different panel mode to fulfill clock
> > requirements. Extend the driver to handle such cases by letting the
> > panel description to omit lanes specification and parsing number of
> > lanes from the DT.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> (...)
> 
> > +       if (dsi_ctx->dsi->lanes == 2)
> > +               mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
> > +       else
> > +               mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
> 
> If lanes 2 we do unexplicable magic A else we do unexplicable magic B?
> 
> Do we know more about what is actually going on here?
> 
> Can you check the datasheet?

The datasheet (you can find it) is pretty useless here. Unfortunately I
don't have a second source of information. As far as I know, this
value maps directly to the number of lanes and nothing else.

> 
> The patch is nice anyway and no big deal so, so +/- that fixup:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry
