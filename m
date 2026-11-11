Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406391;
	b=Uzi7leqzysO6pAe1KIo3K3ONkTITEYSKZmMyZ0bzH/rrlBCZMpFQF4MU8d5bAOSNI2Mz
	 9wzWCfHiCgBhwvWSQvK2OjYFUbLU/6vCP9YcssLmGZKl5e62gAMKpRe6nB4L7yhlpMkx0
	 tVaz5xno0NhdEPGFS9PKKznvHvHPkWAz8l3sQ8v7Tvwu7ZcSEPla/jxN5RgqOZZONINhp
	 Fk9BrEtgaJc0wSh+yJNfRjxWmFrWVPXhrYFXcDpr9ZOrXa795W6Ygpcxi67j9wDxAnaH9
	 jnVi0VYA2T6UrWDjPmFlNmK3yTikBESCvZbVy+gmUDkWyvI3ptQF3wpkkaNP4/Pp2QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
	b=HEMkqzfzIzKLTceLHviFRa/GFUNsMOJqbpdJ0PUzmoWuV/c+6qA50TZxViY/Gf8m7Mby
	 mk+8yzWUHS+E9U2ysnFjeYed0ducL0kO9Ein+n1Oa7qBB66GL2xMeL6G67UPz3XLC5mxC
	 smxq1+gKRbJHdb23+zGy5imzxBEmfnioW7qfcGmYqtoo77HqMWNmZg3hRzfsPAsNUkH6F
	 ERad7dU8v6P6iytNOaKSsIZbOfwzSwR+0Gy17ipNveOj3Deo6nhh654aG6pwDdGAKptEO
	 aWBz/Qn9zO6QpCIti3eHTFITUu9x5G37lXegszrt63jiak1JfertW/TraNRowUZ4AoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ZCbj/bq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB41606A884
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB41606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCbj/bq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ5892974974
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=llfh8etuwqMEBoatS7BG9atT
	A4vpv1pJNPCbkPuzpyI=; b=ZCbj/bq/7etR5mduMsXYp0jpAwQ/AZdMzdYdASci
	VmMJONZ+iJEIUbANBiDjtZphcWabwse7wGo9h645cixX6XcXKZ/uGGfPLJ4JCERB
	e8I7/d5uvjtX6Fw9P/v8ncTMUJg6MECCmrpbVV9qB8RiuOe8CAEq5tV0DSgzvrXS
	ey5Gg1BPNsa8KT+NcxPxPlnh+AJcYxc7TyWgZXzrM+P5SfYUHqybWuG1ftpAHVZW
	5w25MerOy+XYX+KP/GioZbvtfeBkosizv8g9POZL/G7BWgPNt+jueA+IlNyGQM38
	I9qm7lpjucG7INeL2Za54FsOjajj4386I+7u307pJIeOXw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cc5ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:13:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99859876e19so534154241.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406389; x=1795011189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=WTD4xvlimwMrg0z+1mJjTCXHFIUaicF2Qp7y0bhilWeVCOAyP4dGnKk1LjpvQEqb0K
         mKGyLWJY+McuA8+6xUgewkZsD80mnA8jX5OMvBY1LDF5Z6TH53K9v4fnUGdnyZnbBKhf
         dRfafsWkFDBJ9TlhzuRfcudpB7IBDdsZ6/ZGWUiS3Ht7HL9KA/SBfTmCpZBSL1CP7iSS
         G1WoO1o3qrPDToUWad/WpmUKlL4mvBg3dVizS+fH1eguutNuO0rlwJ2hiEuc3Y7hoF03
         T2n31CpVHeQiTKGr0IYARsxSQIDwqSLKDXLmdUVG43AyE/EmSZZxmv1eJ7azpoGy64QL
         vtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406389; x=1795011189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=YZsM1rYSOiuvgDp06yxMaxIEymeVjIjma3ruq0dbeqRN4EAgj3LUpabbZW2sY9oRXO
         tyypkMeg4DAAa1vqtwHVfywXq7xTggOS/R9ashl/uD9CH2yyB68eJGIWS8AOUjX1bipO
         WtSc/2f6hnN7PtxZQm24r7Eewv8JaybO8v1vDtUCw3omo4IaKnvPXn5i4FcHD9R+8fNW
         etzLgk8Bt4NtMm3uJdrpA5bJz+gPJDSji/noXvGRiAKOVopqKsI1NLpUBSeZ1i2TRVGm
         +K879cC6zNlix/4iOY5QWQCq+O2sglxqTaa8BzP1n/F7zVrCT4rCg2U3zBxgfTSA3iAW
         rtcQ==
X-Forwarded-Encrypted: i=1; AL+hErEZsvgmnwgguzUxUqexQMmgUqJdf98170mf+jsx2B42NvUVVpmv87vG1OfGyx18blhhEGyW+EI9cmPh@vger.kernel.org
X-Gm-Message-State: APuU4Z9XXA3/CH85/RblltLfD16N6xoOBz/8bya5Z8xBbthbUQ/8IxBt
	s5XdPxlOKrLLXwOj0qrirEU5JY08Po2G014BNbAhnM9ryeJSsuJ34vpnBoDBCjTia6SgbCeV2mq
	bb2r0M1qacwdRhcbPDehLmQeJxTr3nr4rfGjvFnhWpo5A9LR6ZPiEb1itnhHWi9mr
X-Gm-Gg: AYBFou3RhzOCeNNQ3xOTAU7PdKl1ktYYQtHTZrOaLMthdygR3mcKU0KZzZUtnXrw4Pv
	VRCYXid9ldyt5dxtYFe+sGX9OmhO9tYRVZJ2qFIbzPbdcsKVPq8+IEaBK8YO67XSbMbP4jQH27/
	PjEylFsU1WSy1alrAOwWLKsXaV4aXNGF6OU1H8etjdkrOKizfmoDncBeHgxMGYC5I859dB3827V
	EChENfHL34k3u1QYKp5bOfZEgh+pITxb715ABypSANN5oosuwGJyqisQ9ug94wHFiadm41Fh9Ie
	NUZSDAOj7cm9TYiCa+2LmdnlLf0B3tO3dmzjvvvOtdMnlfqEkis1m5kD+dz4vmljwqOVo08jIqA
	Nr2I9yza0zasS08puQmq7DwB9vbT/S3/0wJGGFCRMRuAjkiKqeELkFHYfccVOr2H4WRlqSJeAKe
	D3rBxhn2ovzP1tDxRsuLiAPpQlSUsK3BbD0u3I8p1logBuS/ZZ0cmOwh/WUdDjcQ==
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791602e0c.16.1794406388889;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791529e0c.16.1794406388144;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7839sm956114e87.74.2026.11.11.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:13:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
Message-ID: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
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
In-Reply-To: <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXw+FkbmqR0P6r
 TvE0XBGERCsTILJU7NnoRI93R/kXNdntFC1Pdjl3qFA43sRkqW4VnpgaVtVDCZNT5B5OsTJkQkj
 CaKk1wcq3IWcOr0xpW7zU71+0nzBqP9eXxPOXNkSPGqdNPbXVmW65HhIkfX4GehCYTQFg0qmRw3
 PLaGfnt5puCtjzgnup70/Yq+mKiLr1ZPg3GLYUBN/CWIESUN9DxuZXN+ul7e2VXRBkzRSArD/y4
 E5tHYZPDNKQDqqxBRz3I6fs18XRKftHhtqy4RGUXnQNQFkz1v+EwARymu32ddqlj1oJ7WQENKKx
 QK5kKugpbGgI8OyS18OPcgIZLh929DbEv+b5yfzADR4EYFOsk7TqSFn+lkV0KVOPjlGiWM80Zk4
 e8LAC9unWz9XaeprGItBfMa02aoIVWTNVXWGQSVthDJx9g8MIAKgK9GX0UKF0loG3DXKji+DjKz
 p24jW1znkclyV4psb4w==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af477f5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XCsYekLr3cgse1I9aysA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: zvtck407hawOZeQoypOv3ASumj5XMzqx
X-Proofpoint-ORIG-GUID: zvtck407hawOZeQoypOv3ASumj5XMzqx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4xajToLx4639
 IpZLwxY6nvAfzTYFQmrP+e8SqfMH7KvJN+yXqE2J/XuUgwKDo6Hppm8kFqGtwNlu/ORlJx5dgYD
 QBDlrQ5avMF1oyQExD96Nq/aomNePo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
> 
> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
> > > DCP platforms place the display pipeline under firmware control, so Linux
> > > cannot discover display resources through direct register access. The DRM
> > > driver therefore needs device-tree descriptions of the Qualcomm transport
> > > wrapper, display topology, IOMMU contexts, and panel connections.
> > > 
> > > Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
> > > subsystem. Document the IPCC power-notify resources, transport and
> > > framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
> > > DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
> > > after the IPCC power-notify sequence has completed.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
> > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
> > >   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
> > >   3 files changed, 334 insertions(+)
> > > 



> > > +
> > > +patternProperties:
> > > +  "^dsi@[0-9a-f]+$":
> > > +    $ref: qcom,dcp-dsi.yaml#
> > When adding DP support, would you add more devices at the same level? If
> > so, we risk getting a warning about multiple devices using the same
> > address.
> > 
> 
> Is it good to model each firmware INTF as a single interface@N node carrying
> the INTF reg, with the protocol-specific DSI or DP description nested
> beneath it?
> The driver can then obtain the INTF index from the common parent, avoiding
> duplicate addresses across protocol types.

Yes, it might be good, but it's not what is happening here. You are
adding dsi@0, although, I guess, INTF is 1.

> > > 

-- 
With best wishes
Dmitry
