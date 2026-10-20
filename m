Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486156;
	b=K9s1FUQmiOvZCuFVwP/wz9tDqgpsl9YLspUZSISV+Tz/hGhcUBHJ1uV+h7RYGReesN+n
	 mWjSWTPGY7Gf+lEdhPbHOqnUxMdUsot7qHZV4bE5I+9/UBD181gLKQo6wxNu+/h6knhr6
	 DQotBdEC+ddCpn+DkYSlWHxjmBeEVD/SO5X7tCv8co/IKW0OqibzzWlqh9J16aijtVuR0
	 pe9Lcy/T2Zs5paSBheabHX8fp6EIIzoEIdubA7QE806GutcAaZCFaMHChQyXPwmJZWp6o
	 wrGhgHAULTt9P5FVLGB27kFMnMyCIxE8R1RnpOC3sgIHypWSpeus2OKta2fiCqNIgvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
	b=E6UnSIGheYPrN0pHLInLPSedhUoetJBPRV4ptIlTXJIC2eKkk/k0YKVqMlRQnoXm4DPx
	 GigAmT9+ydvJibB/9Uy9nfisaL8xAQ8TwsApiV9Gj54fv3nc4dVois+G56vdikUj7bqkq
	 WN2T3aT3vAfkjktoJQpSXHKZp73NhoSYmuSme8HLu647x6wSDqTkF6hZrZp3hwA1GPrLl
	 C2kM5NytyMLl8pRmXe0EqXQH9ViRPMA4viioTMRTLaV3+XgkMqp/X/zvHNgm9BXpXCWmz
	 haFKw1bpmtlUqcxOJeviKu5yqcFaY0l+xCxke7uhNM5TWX9BuXzgz/4f45YyDAKdLzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GU8MIr3t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD9606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBD9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GU8MIr3t
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8XVSt1211310
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/bwyW8UsnwQhwKI8DmK2Awa
	AcEZQ5pGOOAly+nFvG0=; b=GGApLlW0BJVZ/RIvl5xIBB5hxywoiAKZgzOiFuLe
	11FLS0Z7tSAl2YgW8XgxLNpU279wunc6zotOOJqeUP07RhR/Hxpjr5P8CjFSLjxc
	pBGamxuNp/sCWgzJqSZBK3pRHCK/J4S/Un39tiiWb7jmIaeKakjJYmjMpPdQCBus
	A5nFCe4Xq/D1LmH2U/cdX9TelQiODCFeXLAx35U0wtmfTIRs5OmpVcYFmQORliOD
	Pxh55DyXxkP2DFPe/GLIAFH1d2qxt9elA5ME1RJ0LOfzzBTH2U6Jm1hv4hYdMqFO
	PR3Ee7f76k5kohnE1ElBk3X+dLPOOznZLjRch4bLn3I2+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1q1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:49:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b7e90fef1so10576086d6.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486155; x=1793090955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=GU8MIr3tPPPU8IAs7prEc2CUiW4KNdX3azdR0qJDT6aXg92zMVFutWjXb6Bor16QIj
         32ZC2N/i0yJMdBoYZpJTJ1v3znWzuYusyjRQSAKN9BFv/xa6UnZAoUJcivPvDhSOEgBl
         JNvSkD8pa/jRgxHVxvZLq813D/jJRGaaaJpFFASH5LBfURKQOhPgGI7n/QDrMSkumiAG
         IIeXV+u7Qz9Vbt/zEShFu9n+OXrEdSu9uJbMZwlxEj+eOuuh2/GCZ7rdCjGZWXIvFyWr
         fvCaIzUCUtRT7OLGcvUU51GeKsYuw+kHKAoTx4nnAjsWf++WELs43AdErnSPARA4EsUJ
         BVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486155; x=1793090955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=ijsBye7eq4ukuk3JPjUve5lA/6WotdpOc5fDrjoK75787Da41STrCxr/SyoiBOlvgs
         3P+T5Op7hKouEKFf8DRdPBlTmxT/zbxMTcmxzcH+fcVg7hCehqObYon22rjrHVEBxFOE
         0GLn/5badqxDhxqF7lTc7iMdxfSn+FmIPeEmQZhQC1jQRuondHHXd+9X8cPjcKN2ESei
         VKhc81KOIq1a9L6ljjvx4yfeQFU+YNVZxuMq33X2nMabMncMs/WxrJC17HGF8hoWu4Ok
         4bSZ48Za/TeWrPSwn65vSG0lNysxoY6EkzMyYwLoaUImHn2OAJUwRt45s+Mf8Xl5ENm1
         Cwwg==
X-Forwarded-Encrypted: i=1; AKwUvBxlHTy/thJfapLejQgX+VhVJMFo/c103yce5/yMi44lZ2e/gH2CmF3woQSRAOSViHVBco9xjPXnbQ6l@vger.kernel.org
X-Gm-Message-State: AFq9FYKmJk05DDuCoi4dwmLlj8Rgs7Dck1ral6qMG7VWg2Uf86GNULj2
	88Qvu/hI9b9XC8uL4XXnoTUyLOjHTOVSejoHZySyroSYoICP6tUAl8RHNU88pzLGOKTijqrbu5I
	AioqbrGeqVo7vImDP0NZLb3++FBLbNDcL0JvITy+r0qz7iv0ZKOyqpdeTfC8wMfVw
X-Gm-Gg: AYBFou2Gxo9h44/eDym5nBJolBd/QAIJ+imW6YlMFLJ8+hTInl3NwIOLBkhLItviXO7
	LUnWCK9DvRsJnea9ZKV4IvdP3N7PS4MYvO/sW2c4CbuTyWv6h9SAauJT8369hlPw5sAF1ixaGaS
	V+u+bXLoQHdEjPE85Cg6YMaUmUDpynLr5cOT/R0M2hrW8ZpUpTaz5n+h99yzYLmavGv9epx/jQE
	LPemg5v1IeArxlrJn3lFLAqhkyVb9Is7CQQPcZI/zHttnz7B1alSl2JyHns7MWkkTiXPraTCL9O
	2+CsX1nXBqtPSntNZE+ygxCHpEWo6zsQC71cAt4NVpn9HP0QkV7xT1BRvZOMQlv641rBKs4uQZW
	XDrxW5ErobUUbGBq0p7FrZOmxkf6Hr3Wu88ERp/PSTJbTpENeTPRqr7gbCyNw2DbSFzdgjTD2Fb
	0VZSskc12cKhMh
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210097585a.10.1792486154607;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210095585a.10.1792486154122;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm23596581fa.25.2026.10.20.01.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:49:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:49:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
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
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ly1eLdhgQ8BUfb9TS_l_fMU0brp0k3lJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX3KsZdBiCr/ct
 8AWrhWgszFpzHuw0lWtkaR3F4zRI6DjS8dVhlWiTwg+9iuOJ2VnZC2BiBV3/n2QAKEqdRaLTyFJ
 8VYeMtL7wqMTVE/J8ZFWtHim4e26Zw4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX+lL/Kaer0JOw
 XxJj3XuZfveEu483Sw4lwTbHZAYJlYUc9jgJYhsmUg0W/nutjwuCRbHZtwiOfM2oihXGE+8RwpZ
 SPDfotUTINAJy3ujZmtJoFBB3MIGhWuCELbDFZ05vO4gPuaMg3MH9BWkUyMbvFa+4XXTxMosveb
 /Hd5EFEYE1eavCQqD4spKLaR6UBPFzYZpgr4Bbr2/e9oPziBP3AWrmqJ63YndUctzjIbT3vAmLU
 hp2PjcW6k53k+BtlY6r4/mKLWGeSiJ8f9J9S6lyQjyFvYefrDediVgGkPrzDZhOJhncf70+c9Oy
 Ar4MS4RlP9n21pDjMWgq4UsTsA5da95PufZgPXOzKOvGODF5WP7VEWcsFwNCrGiatkVE/bS7zFg
 V4gZeGb+LQlNvWYomyfnhwd8AFaExa53KJgSacJSwH7jIlZAmCaySpA3Gv/IAr5AbjpgvE145L7
 Aj3kiR7ZFCOhHVp+Esg==
X-Proofpoint-GUID: Ly1eLdhgQ8BUfb9TS_l_fMU0brp0k3lJ
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad72b0b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=aMj0She71zyoh_EkCE4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034

On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase onto next-20261015.
> - Add the ADSP remote heap memory region (no-map) and VMIDs.
> - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> 
> Changes in v2:
> - Rebase onto next-20260915.
> - Drop the CDSP glink-edge description, as it was merged with the
>   CDSP remoteproc support.
> - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> - Drop the undocumented tertiary ADSP CB7 stream (0x1087).

Hmm, you still have this in place.

> - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>;
> +						dma-coherent;
> +					};
> +				};
> +
>  				gpr {
>  					compatible = "qcom,gpr";
>  					qcom,glink-channels = "adsp_apps";

-- 
With best wishes
Dmitry
