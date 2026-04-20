Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A019C54E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681944; cv=pass; b=YnYa3s/xz5SaGGyLLQ4zC0NenO5hhU17T2BgZjczFnb3+GYq1j1rMp+vWO7MZ17eUgdl4n57OkAP+s9MS6rSpuuhL53iPoh2TkFMF6/kTNIlS6/lAAEJ5SytAj97cMdwI2+gXYrazlUcOQNs6EioubGM+XyesoaJ5fCxTc6A4c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681944; c=relaxed/simple;
	bh=IR70JVoIs3yq2gZ1hp5LVuS2Ct/JX7vd0R6PmPyNq4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX1wNT8axGel0JRQbSDlpcSlboddLGqKLRgJ5Y7dkwNzBZ/IKtMhGks6wu6PKBRAS5HDr/HNt63rZMlCqKudY6BRPnN9nNZi3plxlWkpG2qq5mjhdNilgYWsm1aJrxnxu44kxMGF6PAv5pPvnGwyQ0JAFr1OIpfmBGmcUOGGls0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=II5zVfvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6VegLYZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="II5zVfvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6VegLYZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91S442281708
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SfIWXxBkhLxK7u2OhjehCJ4A
	X3QgUohHA6Ds0OvA4qY=; b=II5zVfvrImW1/W16+tu7Ys5mTvfMSSOhWKbfTo28
	vFiqqP1/kgXK2ViipP1qsgV6H3e6ZTz/htAEDQZtiqr0EJybyRs3nW+ZxwuLwkgn
	D0Snrs/5Eb34ulr+5iQg0fTyisLq8DyABY7ckOxmI7kXkF9NOZ176q28dfmcTeaK
	zHPYTkYyXIGeDq78Q+SqZxaYaV/7SJtDhGO2wcA/GqVqhAHLw2HDiDBE2h1nbJhl
	hOOWC2dHLjKl7gpRre38nfkS5I7lFNzqWVKTBkm8HRhpw5JFP3pL61QjvpsuoMRA
	PZ7z323mocqA066Ot2MbuyYaDm3rxGp4h2R1ZTSWe397uw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598cky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:45:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so37932365ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776681941; cv=none;
        d=google.com; s=arc-20240605;
        b=JYjxLOx/sQrvEhQeGN+Sb9ox8vuC/kgSV5g+8MqMaQgKg1Nh74jqvnyYKotzEb7FZT
         j9bgkBUdCGiG9CdoZbXwhlgOFdgML/t8j+04HOd+K1Yo+O6Gaj0x3PtWCAtIQIuHU9A8
         XXiDWoP9cIxu3sXB2w7foXOFb6se/iY960Hj5Sm1foSI8wy947eG6GiGllv2hoiXVQw+
         Ml4QgMcBV5HvB4ChXYTDr9RWJKU19Z0WmS2CQjx8hrPevWGprdidwTUzHYlWlLA48Fsh
         Z9taD15+oHrYOTZSdp8HHjPJPmGY+5mt2gMHfZMKxMkbem3yOm6clw2kVfdXFgDfVoMg
         27ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SfIWXxBkhLxK7u2OhjehCJ4AX3QgUohHA6Ds0OvA4qY=;
        fh=kEEApKGAectUPIqkM6MpK8NWkfPxYagMmlCXRnBsaBQ=;
        b=SAaBxcfNwBbQQhvpKrlHYIcrSg8CHgEFcZz0QtZqVdC91F+oIUKimfY+UpdO2TTrVB
         z95jQwh0eoKLogo0xM+NWKnJwpdOOGxkRtxv5ma/l4+8ZdSN+x3zAbhRBUBGBNusx+qA
         eTTP1GT57Tpapo5T1jWhdXaNA/XK4ylekVwDW74ix26Oir28/xK4kb+S1+QTwigAyGsC
         fhujcn0uQdnzTwjs99btUXhZGjZGtqdKSJibmwurTbcEvgYDgCkUpEVsccp5tRzLtcPX
         rMWR8wZeFIefyuUz0e2VrsBsvnVDcJSAVUpyEIdM+qEZHDB1hJzhyv5jZ2gTd2R/3nuk
         G+EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681941; x=1777286741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SfIWXxBkhLxK7u2OhjehCJ4AX3QgUohHA6Ds0OvA4qY=;
        b=h6VegLYZBrcbC7pO5DxMpzhow4f5pziSq27HSv67oJHgsP/+mYQe3OHnpusZCYJtX/
         AHK7bulI2Ho1dAn7ofrTgcYfKplvqkskMfXbi+cGpABXMG97z+ui9hlQ+ryXX0+1ufwh
         2CaWS0wKBABG62u/2+oPrltGBK30pJnYrI0vH//IpD9tZOaKNDM1nftKSzQZ/NnQTTnZ
         Aohzl3Nz1vVSo0MH4LUk8gctWRJd8XzPHG/6Uj1yq+YIhcHzY60tn2Yh6cdycaPiNg+K
         0hwSYFIS0SnmQwIg0WghcQvAShlRIVZFaBggYd/gfHicbz4tvSFKFKa2BN0BswFTFQLt
         KRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681941; x=1777286741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfIWXxBkhLxK7u2OhjehCJ4AX3QgUohHA6Ds0OvA4qY=;
        b=qPH9GJ6k0fjp5XRVBCPBN7w+8WqDat1LvkXYXVoJZ7AhKvlQicByaFT/1rbzgl3Q8c
         S8ypMUdM+nKyPCXARXGTYuJ68UJ/9i6SlREVZnj6amQ7xXHJV50JTTyYeMUMAxohIyKA
         fNtoYba5yy9zhz/OrVUcNF+bxUp5nJWJo94qcmtkqxnw/4XZIDNeUSphVJMCMeT3+ANn
         PohJWVx0PKAeLsMDi7YYstaJ6LFwUqn6/eTdeHZTtGgoAHqdyoZQ3nwB2pFMvWqfgqLf
         DalZ+d6zwZryA5+JYe1H5pfXM8VTv05hOjqlTY06m/5yL4fJ0SG0w5fVDHOmpsGm2Jqj
         bWsw==
X-Forwarded-Encrypted: i=1; AFNElJ+JOlxQsWjbvh/245+JGxJgUJd9kMp8d1nIEd2oLUM2M7WMF2Cdl9tiDe0lY3GVHIAdaadZOm1G+WZb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9MkHrxL1gwml1Eg/UtpGtOVvht934bWpsNuQqnUeUeXpCfb5
	5obdegFPkBukuD1/6a0rBaE0BFeA13tF/Em1woiaWRQWOmDBUkNRIEnU3VPbrK/PRNi/N2iaBrI
	75Djd/Q4CgC4jnqXd8wwV5v9FCaBupm4k2MZX6R/kKct/k8FNkZTHw601DEcwT5sqVVDtIxtmvj
	Bj8rR5Lvqi9VImzJuENTDTYugKb8rBUn2sSMtL2rA=
X-Gm-Gg: AeBDieu5PXB/tiaxLiK99PL1fjoQw/YZCCsUtNuJTwBJjAwLgiKq8/8JI7cmroMzjqZ
	FA+FRo7rCreu3G4haD3BV7CFrXxVD0PPM/85hECTBS/VWfu3K41XG/iOzXtqszIm6vIM4eV5DIm
	ypTbScSZbmkRxf1/0HdTSji9Ab9GwC6a07q1z81Ldw1xLaZu1OFwiywDyWzPIKZ4iOTqIpi/wqb
	mYxVNKY4ZK93q8=
X-Received: by 2002:a17:903:1a88:b0:2b2:4c92:c389 with SMTP id d9443c01a7336-2b5f9fe62femr142505715ad.34.1776681941179;
        Mon, 20 Apr 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b2:4c92:c389 with SMTP id
 d9443c01a7336-2b5f9fe62femr142505345ad.34.1776681940640; Mon, 20 Apr 2026
 03:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420061644.1251070-1-syyang@lontium.com>
In-Reply-To: <20260420061644.1251070-1-syyang@lontium.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 13:45:28 +0300
X-Gm-Features: AQROBzCoPw50l9Eoh8SJoFxfLCMiu3F2VqJVupemyBK5G7servJzS1gldue1GlI
Message-ID: <CAO9ioeVFHn3ARCqL0NJ9jRCJV2P9-Ky2c105iF7EwLUG-cV-QQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add LT9611C(EX/UXD) DRM bridge driver and device tree
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: mXtdkaX_ReNTZO7Hhp5OS0_R54SIrs-M
X-Proofpoint-GUID: mXtdkaX_ReNTZO7Hhp5OS0_R54SIrs-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfX8igAwB4LSHbC
 XgRLPBjcvtRA1FeHrK2y7/fbdsCzAs3JVEYHi5baXZDLnFp2+ikrQ4mbeMsF3FOTtbMgfhyqU+A
 fPtl5WICaKSeHUan7WXSJmcnOmnsYPEMhFbqSMJDn+bzmxkSDaYqL7MJqzMHIQ37Vf7r3ooFHhr
 bKCEMlF6uBVlbctF3kHyBMppRBEie4utMKH8aQS4D2SUE5YmewvtJA0UoAkHZ/+lilUoblZ3hqc
 jxh1pzUQBzn1e+3wn8N0hjgY/5scbNi6zR5zGz1DkEzaOPGI0eHsg1IH7QkD16Jlma0zG3CuVDn
 W6I2NHO1tekCwu4l481PGd6Ox2dQR4EhTvYyoKlvYWYz2L6WakrdqszmtAgSJCJ17IETDCIjera
 6LaL55pi3Jy9pG8H4ksEjIB5PxDoTXZ+eT4wBthVSiZ0Fa6zRt/xMNYzy2yRg1+m3SoKTmynme7
 8E8IRvOYE8LV9z55Lyg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e603d6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=JWicuObQ_znxCAsEpPMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104

On Mon, 20 Apr 2026 at 09:16, <syyang@lontium.com> wrote:
>
> From: Sunyun Yang <syyang@lontium.com>
>
> This series adds support for the Lontium LT9611C(EX/UXD) MIPI DSI to HDMI
> chip:
>
> -dt-bindings: bridge: This patch adds new content to the lontium,lt9611.yaml
>  binding file.
> -drm/bridge: This patch add new DRM bridge driver for LT9611C(EX/UXD) chip.
>
> Signed-off-by: Sunyun Yang<syyang@lontium.com>

Once again. Your messages are not reaching the dri-devel mailing list.
Please fix your SMTP configuration or start using B4 tool and B4 Web
Relay for sending patches.
Most developers wouldn't even see these emails as they haven't reached
dri-devel.

> ---
> Changes in v3:
> -dt-binding:
>  1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
> -drm/bridge:
>  1. Drop the licence text, only use SPDX header
>  2. Sort the headers
>  3. Use library functions for crc8
>  4. Drop i2c_read_byte and i2c_write_byte
>  5. Lowercase all hex values
>  6. Use paged writes as implemented for LT9611C(EX/UXD)
>  7. Drop dev_info, use dev_dbg
>  8. Modify lt9611c_get_edid_block, don't store EDID in the long-term structures
>  9. Use HDMI audio helpers.
>  10.Remove unnecessary flags,Implement proper cleanup path, unwinding resources
>     one by one.
>  11.Replace devm_kzalloc with devm_drm_bridge_alloc.
>  12.Remove extra kthread.
> -Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/
>
> Changes in v2:
>  1. Forget modify code, operation error, Please disregard this submit.
>
> Changes in v1:
> -dt-binding:
>  1. Submit the first version of the code.
> -drm/bridge:
>  1. Submit the first version of the code.
>
> ---
> Sunyun Yang (2):
>   dt-bindings: bridge: This patch adds new content to the
>     lontium,lt9611.yaml binding file
>   drm/bridge: This patch add new DRM bridge driver for LT9611C chip
>
>  .../display/bridge/lontium,lt9611.yaml        |    8 +-
>  drivers/gpu/drm/bridge/Kconfig                |   18 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1365 +++++++++++++++++
>  4 files changed, 1390 insertions(+), 2 deletions(-)
>  create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
