Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574573;
	b=SWNqEZpOZ6wqi8hE1DOlfPhBkFIKqB1BvxqXXAAJPvv1S1+VKjdl2bOrAMr9FkWGne7K
	 yIGNBRth0bn0qOGDJBRyRVUBCOxyNKJ2vtMz1HU90x0n7RxArZZdPPnf34TbbGc2EjMcP
	 7viLeqsHtM+eMEc4VQAvQwWjSwdIssWyjOqBX3E2j+6hEC3P01PaGTOfnc+WnO2yza8Mf
	 q1xjA7h+0TedIkQIPAfU/hHuRr5UGCk5qSqnc31aYIZ4Auf2bt0EJYoVQr3soh3l0bSAb
	 Hf/IIXHJHCvHZsaeVp22ASFO0lW6cyOb6oIj5c4prVFGRJq/J0C8EN7Z7VMuQ2a/25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
	b=vZbSKSHkUvJbDfRRTmRgsne4OeiL4RUbJqCneo0CM0godtSFVwk9G23Uzmf1l1rWo42g
	 hyXJBy2jHVMgn8SNPB7/i662cq5x2Pvi1rLPZzyNbsswYhE18wTuMP78MRHKiw5fyx+5H
	 oV+Q1nznbi8nNipeeo49hfQpcpswwF0rAOl0MXcPsccTbF68cUjPRw5FfOsYTumhZjFJq
	 xN71X5hhgEzQQiIog0KC3ptbsNvBLvk8tjWnKKQ3KiozJ4hGwuHD0HPK7P6pImOFK+nfB
	 RPfB5iNtXgxmCvhlIlIGSM/UxHH5ZbsethklVuHDXlfsNc0kq3wIT4Kil8e9jEmljlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA4606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9FA4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gp2PkA6G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewmEhvw3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Nelg605627
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1qyY9vNJg35boytlmY8FgdP9
	XXj7oos7HKLsMRF6CNI=; b=Gp2PkA6Gay0NWw4nWoX7LGy3qwnvVM1dhbgzqwA+
	OfbLIc70GMCuhPmIM6qldxx3yr72RFKnKJeNFRkCt9aCB7bu9vne1Ix9b5mbfzVZ
	YBinjI4QoLYiXs07x4MQUt271rjCH/QYPcpmUXTD8vrKxGXOkA4rctJtM8g+J8lE
	oBsiPVTeB6KNh7OThcV3Q75DfGYRpyaUIfhAfGbefL8KRMDLNK+FVge906XXOkQb
	ZNSyIiwpvMZi18xhrhS7XCc7ZHYFqzbx6Vc8Mh7G8OwzveJutLHAyigIRtlZ/V4g
	4Au35tOcXVkCTfkMNGap91FXPFfbidf8mHq6ufHr+YqACA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk7wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:22:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so64150785a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574570; x=1793179370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=ewmEhvw3IfGKeS9mWlYQJjMzCCKzoi9oPEIk3J5OlddzJuP6XsOJr5gycVakjogfpN
         tIuUoKzl1MkeNUlFRsAceEfW67xN5KF0tNoppfUsRgywv/A8LbfDDh6yXM/LCQCnvV6u
         qwGkh5gFIjuyuB6Fc/PG0urC1zWAHv3ZTj0HDiQgoQ++2LKlFsCP5rBgvI07PugVjjpn
         C9j6EMXYWaG/EannrkguZrkurYvH/IjG9mcoSLD3b/tXHEGhUKD0Sqs4V3lB4KSoffVI
         yiopzJjMBjNi2ptuaGOq2iB1BIvBqlvQIZLZnCmjpVgXj/BqXH+axwHgLnA6UiMulfb8
         LyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574570; x=1793179370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qyY9vNJg35boytlmY8FgdP9XXj7oos7HKLsMRF6CNI=;
        b=VpMX0s8cfGb9UBbd1a3hm8hrNg1zA19vqIcRpKS8+eURmhij5d7MKPUxsufPk5NJeG
         BxBlWKF4R8qq/jFm2+ZAG6UyFk9h+70SPLsMOZOpOl7O5Of5wFxCZoNzkVRBoQlAyEHs
         /JY94PzEsSrAaOymSTrloIV1QDRvDc+sXmDAAH8WdD/yYWCiAebUqCLMc6Rss8NNxrni
         L5u44GND0ybtp3BKKTC0YIHyz6XLVbeMd/7+uHQTNv2eZpYT4cmWM0664Iz3oZSj/8zn
         ntP8wOhxvMTghcPF5ZoQAi8/Ny10K3GkF6MlQhSd/Myzbp1P2/OT8b0YYgeh8gdjq2pv
         sMLA==
X-Forwarded-Encrypted: i=1; AKwUvBymNS72DNpHXPfLhIpzy4HuZoo17zH3K53L+fve0JWdqIGSpSFstRm0OiOE6IGtKjFiDJFMn9wEKhlE@vger.kernel.org
X-Gm-Message-State: AFq9FYLeRixfnTYdDqYPZ/p+ksciMHN5tLnmoQSVgQYF4VvdE02lJCTt
	ACZ3mBEyjYEXwsIczu80+WBtOPv/68mbPOqvK7OlQVhuQjD+0cqLIVUFW99iAqNhx/SH/JA/bc8
	heEyCqp5QsIsDHrJMyJ2jhApvey+r2EwlSJu8/ScxTF2cv8LQTiwA4FT2ZyMPs69U
X-Gm-Gg: AYBFou0xl2BUavdy+CimunTc37q9Yr80jgcJkTKPKWJOuVT5PB03tDTdE8+kxmsuDG3
	AJmqET5wPOPetVG5SdpNJFE0YVauxVQ1/gTZrsuXJSL3fc2EGnS0y8U9L28mEmB2EnniiyuEdKE
	nfjK9iUXGVlhE63g9uPtH0UwnN/VgNCTEuRE1QxaayPLw2gqJGhnPYjcZ9tbqdSLJsvwb/c32sq
	34O2hsgIhPF6F0VfL2XrrpVVsOOoTJbAv9l7M7kFsgEgg2Ab4wjL21Novn1opMOlb79G8g+TPFJ
	sEwOCu/KBfsYoj76zkTyQ3KXLlWgcOIkJja5XMbRoZtAWd4POfAVY2JfvdSiAw7mItRYMz8pMf4
	J5Gw7aFiDO38jtr1E
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326673285a.66.1792574569759;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f57faaa9bmr326669885a.66.1792574569184;
        Wed, 21 Oct 2026 02:22:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm4446654f8f.16.2026.10.21.02.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:22:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:22:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <k4sf6tipaehtllokqlunyocxuecttbitewgzjzgbl5mdz22jfd@p4svha4g2vvm>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
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
In-Reply-To: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9+9qIc4w1BIC
 9L7NAOTKioLo4eURpNrAd0SYTLstLzh87MlyGX9RB4BI4ceEZy5td+rSBtFfk6apTdSIKLHptzW
 Q5IKKdWG5SOSdOShWp9kHlfMbms8hCf3FBxOV3xkG/H9zosjqsd5//8GkWUanYFlSWOeM1hSGzb
 nnQBIs/otjcGgBYecp97zwHVh0IC/jNiv6m15WooM2x68VK9LdN6XI4OaZhEucjjk9crIO9joFy
 uWjE1SKURo6C+jtEENyiQGGDcJA1iVkJ9eitu9Dz9mExrG+FTWq7WEBQQcrJOfl0YETEwzfMmqH
 pGZgk9IyjZJyvHhuzLIZKkgrIiXHX3oIHOQxc6CInnXOKPjBHuPcTpbZcMo+Ubhp6IrnfTqLmkq
 NcMGTURm8WZMLU+P6f0HQ5GOmcf9s51djr39+P2XccpDmhJSMGUiOD7riBe9yGlxWEVw0bqFlBK
 duSw5MarSS+vHqgwLrA==
X-Proofpoint-GUID: USX8MbXZh2iG3IfHnL6DvH0AElBBeMs5
X-Proofpoint-ORIG-GUID: USX8MbXZh2iG3IfHnL6DvH0AElBBeMs5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX7JpppNTyH4cd
 vTj8N7238VV3SEx2FfaVP/aLZuunSpO1NblHwO2SbYzYTvo7CBWLfNJRuyZiGXr+1Op6GVKYjeT
 TDOPXCyyPukIelfBTQbmPc/CySVZCSo=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8846a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=eVJ3CmYOr2qKXInMw8AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 26-10-20 11:49:10, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Rebase onto next-20261015.
> > - Add the ADSP remote heap memory region (no-map) and VMIDs.
> > - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Rebase onto next-20260915.
> > - Drop the CDSP glink-edge description, as it was merged with the
> >   CDSP remoteproc support.
> > - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> > - Drop the undocumented tertiary ADSP CB7 stream (0x1087).
> 
> Hmm, you still have this in place.

The tertiary stream that was dropped in v2 is 0x1087.

The 0x1067 one on CB7 is the documented secondary stream.

> 
> > - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> > 
> > +					compute-cb@7 {
> > +						compatible = "qcom,fastrpc-compute-cb";
> > +						reg = <7>;
> > +
> > +						iommus = <&apps_smmu 0x1007 0x40>,
> > +							 <&apps_smmu 0x1067 0x0>;
> > +						dma-coherent;
> > +					};
> > +				};
> > +
> >  				gpr {
> >  					compatible = "qcom,gpr";
> >  					qcom,glink-channels = "adsp_apps";
> 
> -- 
> With best wishes
> Dmitry
