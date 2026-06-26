Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4803978F2B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507121; cv=none; b=IUYcaq2TXdl1tLV+ZaPYAuR2MhBy1y5/M1NY32Cktq75yGfd+Q2BXsIuxaeYU5d4bjarKhbrZ+GZQFtGF50TPitQWez43UBemhaF0Kia1iSy9ofn3pEft8JXxpX1e+XnpFm7jN876bCuHtZHQK6sr8Qa31C8qz2zgiO9X7k+JZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507121; c=relaxed/simple;
	bh=glTje0SHGKlC2O0ypUPh35USbtgkKD62Pb/EXcf9JII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUBhEmNCcU+ksCfvCeXZmvho2m6XMVwza7VHHdMh/766m+a2ixyg7KxneL1uyOaGNzDgQqkep0aG+Itklwoph+5ZVveMRv6ca45IytgxAyCp/pn2IGgdENhcKUbDJrfSu/v0vv+AR8Tm3+Bacmg8Vv6e9g5awV8ZKOtut6wL4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+V4AI96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwPlTOAJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+V4AI96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwPlTOAJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8asc1980854
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKOnoEyFWDXwr7o29D1hxEeo
	ex+IYcsFA0olkn9Z9N4=; b=i+V4AI96BKmhrDCEqgsvg/u19N9C6xGtwpqu9FEp
	QtMPLsEnCOV/33NhzPQeR5WIIARh5oLOe9uHSthJhdrmrlEPt6wYz6BXVARACBrV
	V+9lWM5a7qV+ljPGrui/E/6ysaq+BrtZiNRn5TVssfLIuoY/WYF21kXEcKAvWZm0
	M9f4+5F6bsTlS/x+04XG3n11IqAkkhzVFG5lMyFO7GolA3hSGntVYOBkvFLSGb8x
	nEZ5izinMXi8mD/ooejaBcruN8jjh+zPBldgvH2TjW97PcVvn/IC3dCGOJYgjIp9
	zQVy4B0C66Gl/uu3ABJ1I0+KqhMPQfgSKQ/PPW7Q1DUVHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2ttk4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:51:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92af3d5e85aso171783385a.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507119; x=1783111919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKOnoEyFWDXwr7o29D1hxEeoex+IYcsFA0olkn9Z9N4=;
        b=YwPlTOAJLaFNtyU+rgc9DPm5Tdh3fSFVdgz07tqM2FMLwoi3u5mElKueXX4+ZTd0K9
         HhEVXnvWDEVCJEsGfxgJw1VlkfUT8qx8fZPBiNKcqmzJgfFJIR3lJRoTGFybso1tOR2e
         MrDXumHguzyyn97i5A/tBBPmSZsyk8AQMp2q2qMeiziDLu80TPQwGfomDSUofFTZ2l2c
         x3H5znIZJsluY5oPcH9hOaKJ9ZlJFQrIlPG5gUHQrjIP/wW2UmljS+YcOuaaFwH8r4Rs
         Ehyziv7K1YcZZNW/8bZ4rIJhXh80tXsash/OVIJKVnM9IULtut9WGToBpsPxjKnh5VaO
         vFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507119; x=1783111919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKOnoEyFWDXwr7o29D1hxEeoex+IYcsFA0olkn9Z9N4=;
        b=FgM/FicOGUzT76SXshJXEoQJYs1RQ8HEtPgS3RfGDMlleFAMOlgVBhn2sl87sDjoAi
         5XPyohZz78r/0rcpjo1HuXT1JgLP0zwwHpCNZ1YOWa/9V0fjFVrnlhFlO02k1XrW48P+
         hRapzXTmV1DBwEJpgd9DZ8YtuyY682Ez8zsNjtShGO5SZOtIrpr+Ij0SNaqcb48dUZd3
         foTAxg4b7fqNulRet/JIBn8oRFyuJxMlQkpWQPMMb7Fh9wl425U3N81g3gFK6X3D3oaP
         xGDJEGNwmnOWkJcQlRiYnODDOvPcuKWlVxk6OjvcclBhORm77rSC/xHKdBJA9tAO+B0A
         FXKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KGOPGSiDoiI+f9SZ+jIK4kGEfVcW/MOJDbj2Zj/Ez4UXoZv/ZuW1LhnU6lwQ857PwMd8JPVyuOADB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEn4Y8Kiy6hBTMSEPa5sW8sD/CQvheODTUTXWPlftFsg6/c2mW
	NETt0IYFoWymYypisr87nOuwlFl5GMoLcVBA4hFzilzmmFaPXdRGW4KCnuR9SZB/6b0cvysZlj7
	x3A/2kAQG9/JgRza5GHr54YIo+xKrGqQubIyXFNwM86rfd4AgQrETm3DJ2yfoDYMn
X-Gm-Gg: AfdE7cnQDZ7eU2UwySTLmfFuXadMqsinUVFtBD0n7r0ipHVgG2THw4mfp6k5ZuzqtVE
	sK7IqCvEdo3TS93t2L0uk80piRTrIVuDDO3ae68/FS9AtvWj/A83pIWc6Co9sIeJ+saAMVwejrW
	I4By9gtoooFT2DhjfYJkYT+8Px1eXiU0ObfVj8TSFZaR8Y51Q+rvnTg4LZ4vuXodnM4r1c2j2hr
	qDs5vxG5l1f8tq70gJs3f3NXFpJu8P7IpDYMZLmWDA9mzjupvlN1C475z3f0cgUrHO7k6i02Hj+
	65XlMI+jUP1IvRfCJBQSkMxTxfNpC/nq16OTiMR95B+jGuCCd1QuBmWydjOKr6mIcwJbpp/iGRe
	Nd3do3etFbNSpF3/t0RjQr12Nm3P7efCOeluhqa48IBf1Ayw8d3DLjAqy6NN+zjSQg/Knxc5A7b
	A0rDKb+FwqFfXVRjRt65anaGEQ
X-Received: by 2002:a05:620a:471e:b0:918:4737:ea8f with SMTP id af79cd13be357-9293d3a3332mr1308465885a.54.1782507118639;
        Fri, 26 Jun 2026 13:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:918:4737:ea8f with SMTP id af79cd13be357-9293d3a3332mr1308462485a.54.1782507118261;
        Fri, 26 Jun 2026 13:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afcf08asm56901861fa.16.2026.06.26.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:51:55 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:51:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <dquxvlawcvggc3lml2twudquio7xy7nj3p2w5atcjeliueeyxf@wn26uoiz6l33>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX3J8Hu1SUwzBm
 ENEUtGghWW6DOhw6VN4sDCUsRWCTdXVKYNT2DmNIn6yRj0KN0dMW++CQZz4M53JjqMgwHmVDLXt
 f9a9BWMtr1469mJtW003NBWF9lcn8lI=
X-Proofpoint-GUID: K3OQOJ6TMs_Im_MaJzNBWDSnStOHUmzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX3e/oG11jj99U
 pqL/g4Mv+/J8uaYtVQD2hgkHq9KZ713h5fDo3Hi6mGlitexLuztLcP5Ogv9Pkb+7V5pep3PnPJQ
 cquFAbKzA9R9J3BOegee+5s9NGv7juucj9bSdg4gr49NiTchNXW2r/l1IV5r3uKaCu8okBszhj/
 DRYZTClGL9yhMaNCdpMw/db8CQ9hmy1dkTAoqGL5eO++ySsgFgBzTZ5jDeqpJpcbPLjPV1G6DWH
 NvulKoyk2kdJafCtSSbJ9LKRUgJa26SYV9iUduwNohwYcUhj8IB9bkD9kJNKIvcmitO0PsMHJe/
 jz0R++h0gohJcmPl8y7bK1qJjg8yQk90YAn/5milalb9SCqUWLSn73B89eEw0/PTAMn0nYmRskX
 7VSIhcAiGRy3LJyrBFQR4qvmyembtlokzS32BVkoUbwnp296k6wIvbkDVRJ43V7CMA3pgi2+ldk
 UnGJpD00D+WzrYsBHhw==
X-Proofpoint-ORIG-GUID: K3OQOJ6TMs_Im_MaJzNBWDSnStOHUmzF
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3ee66f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5DEvdoOZ6e79lswV-sIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260172

On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHY to the
> controller now the mode-switch events can reach the QMP Combo PHY.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 0acc6917d7aa..204513a6bd89 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> -							data-lanes = <0 1>;
> +							data-lanes = <0 1 2 3>;

So, basically, you've force-enabled 4 lanes for all devices, even though
they had 2 lanes enabled only. Don't do that. Squash it to the previous
commit and enable carefully, only for the platforms where you actually
know that there are 4 DP lanes to be used.

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
