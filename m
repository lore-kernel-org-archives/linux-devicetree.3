Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3D317152
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189389; cv=none; b=tWwCJYlbdr9CFgURnCEStv5eEUc0THJeSEne0efP+S2N6qyFoabDl6qRMF/Cje3Np3RKQvB6St7jDuj+vGqDbdm/zNboWYCIL04IHyOTnDCYjyHDhOFVlVhYSZqLsCb3IQx30xkddKaE0J/EAbuH5RkDCZNi604YpgU8+MMIYU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189389; c=relaxed/simple;
	bh=7aBT2DK7EHhd1zMiHlKrhw0mccqkDL6WTD1AjS25XJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPlzYzWuHM2c8ftIedCV0i8OhshFZ1aP1iDmHsSoPCVX2PwLbxGrxOPPmuHoHjTGTeB12b77s0Khz99whoMuqH2sDHjuNWL7rOxHemJrPd4TDXe9xwDfCJJdPgEw9saxY48qVBR1ZOhS4h7x20iKMaBS5XvhLyF2IOdKjIeFvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haTNbaQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm4eM/Nl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haTNbaQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm4eM/Nl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC7AsM280857
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBCQAoKuaAbhqEJpnCtly0r8
	8WL53vqH1z95hkDBEPY=; b=haTNbaQ81NXFL/jxs5evOseocmMoZvkGthci9wa4
	kMchjbnE0usUgZrYK7JFakcPvxNDbtHPiBB2sDWAYXZwf6e+zfC/ar7HFZMldFRY
	vsxbhsyxag31AfVfHGebx1fcQgvnZg32KecZTyfdtdIGyBMcMePAWybG6HkZIyQN
	H4bw3e9NLyPVBT2S+q887s5V3JJmQLwAZcsEGOsLwniJYzJxj28QxUd729eA9+/W
	mNdWYw/+s0jFhKKJO/wmQ2C/KJUHB/skn1tn8ZmFJisN73bI/tzWkkeYlk+2L3jz
	3E9fRaeIwok0ch/zOgPRnaGVTP+183H6p/x/lQEa2n+EZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkxv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:56:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so101803641cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189386; x=1776794186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBCQAoKuaAbhqEJpnCtly0r88WL53vqH1z95hkDBEPY=;
        b=Qm4eM/NlWORnaJj/X6wkb+FM6uYSnUzlNMM6vRaCm9BjYgBERbEYGJB8/Xct6MXEWS
         A7g0Haa5ddk9QVsshnRtM7IbKG9Q51n1A0KsVxSP7qKW5joHNtcmvX6449hu67ympB3X
         CvD70ixH1lKSe6KJVWWE3/ixUKvWjhsSonORVwV8r/Pdsz9vwvHvv4JY3x7kjCnUjps/
         6sIqOE2/m9R5Pc1XUk7OEnvG9AiQTz4HFUUZaISueruR/Ma2fKrBbBaFIbXgldgpWqvg
         08dxBAp9AmvqSvXPQKfCST0l8B0S0FfjNgzuT0x9Ni4bVwLrEop86wG+3C97TcyC1kip
         4QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189386; x=1776794186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBCQAoKuaAbhqEJpnCtly0r88WL53vqH1z95hkDBEPY=;
        b=GWi0ASD86TINq76IH8gtwdkSPS8Kp/cJMJ33UajmDUyk7d/UIXC/L2OezQ80+xKcqz
         k9ZKBnD2LqMr25d2MRFoQ0/xH/MtrTTsiAShUJK6SmSQUfmweMLEtDUPts0RjR6f3sXX
         JwlgChbToxBPj20sF+DlqEMV7sR+EuqM0EiGFOVJV1+BdD1022IXFUki9ULxgXX6fq+C
         1LkieHmgO0gyN0aMoaxrM94P2sVHs8JQGoGSvHcvmLBs3QCeNNgXEQLjkvUbLfJOtesR
         6q0H/rAjuzG9RpYD6T0uuV62EhKGjZoa4yQZsQFpfRYNp+hYpfJUFoymHX6cNjL9p2Jf
         MU9g==
X-Forwarded-Encrypted: i=1; AFNElJ/6yR0o9o/8wyu534tOs5VpACjW/he3LPq/npZg7+Kj0W8FFg5si24ccivVdJyYo6fSdVwly9tMsyML@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9UXq9o8u4ibq9msLi2vt8bt84zR6SykCfCGz83OgIc16K77m
	mJPoZ6D/KR236vqhXOOv01oeX8r2z39O1SG4jYCqBWhrU43Ql+eNYt/ZEyb+1LeNxlgGHQg0BgS
	r4pJEtitPZvNtiiBoh9XiOjcTxItaawPPw12jlNdVNqAnY79AamxIkA4iCirvRaAg
X-Gm-Gg: AeBDieuXWUVaONSzdh5gBUJ103vURWjSsUUAMuYA2/RBJNhJUXd8pLLjmNSQa9Fz6UP
	FCg7BlgJqmJUM7oXgWHh9pSi9shXhN1nUXbeMJa0O0VOPZGV/vOeJXbTKLWD0CHoKwOStVtFDFt
	GSiq+LltYRpwXuneV3lov666xdOtyEbX4TIoii99A1eoivqkLjNBApO9PxweHjhWNhtg844/TuY
	iG+IuxKMKIircG7qwc4NrzLCzYeqKnOMT1x2K8gDxXR0okT+l4sLXC03lOgCBpAqRE/QFmo3JBZ
	cGUzq2AglQmAf5iPDQkBXTm2AblGISb7Zie6GAD9aX0lktJ5YgjLpMGkwWCBkC8DSiOKJNhlK2M
	oX5QUtni+x8sXTzmOzb1JXczqtz6Ab+q/moUlkwZPVJLxKuoZ6qjRA5kZdlzTNxfdzOSsDZ8QN4
	7Cjpw+OxAGffgLZJVELL8QRN3LWMQh/5kwn/mUbiX01z+osQ==
X-Received: by 2002:a05:622a:598a:b0:50b:526c:541c with SMTP id d75a77b69052e-50dd5c13154mr259578091cf.50.1776189385945;
        Tue, 14 Apr 2026 10:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50b:526c:541c with SMTP id d75a77b69052e-50dd5c13154mr259577551cf.50.1776189385445;
        Tue, 14 Apr 2026 10:56:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb1esm31525781fa.35.2026.04.14.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:56:24 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:56:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Message-ID: <vp5x6ood2guxtcqnb4fp5sqy2j2tyf37lk2pkypawexxkopf5g@4lfznaqhehix>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-7-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-7-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-GUID: ihPHn0Ma860OACaSnRPEDQCxJ4oIRSqu
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de7fca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CipEwJKW4Sg1KE0sZiEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ihPHn0Ma860OACaSnRPEDQCxJ4oIRSqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX06CWYNhBu1BS
 GWggNwRG7PmPurtyUSusvVfrJo0qF+K6d+/IgO4yyAlkjFqXFAuiWyl4Jf7BHS6P6De6MHon5YS
 9jPkHl9G9YdsgOMQpJAwx4qvcdAZeXR73VhhMo9BAv3Yevd6H6EVAuV0jFsCnJdcRelVA3gyD4F
 J6YjVzt4ad6PiItFX31EzBrhkUzTj2nDhp/GOoCtEEmd+JNcvwXZT3HSRtkL55Y+6timAiiRhMM
 CExQNBGGanf5HiwxblV2rZwWo9ElsyBTXAwhU3xC6Ci7jmRwI45QUmgj/4VqF/4Ht75bf0sSqKn
 qcDi89RyTOHPFt7uFv+nUqO4I64po8lglHjgofdt5usGfWgclmtLGifGeA8vS5GWXWO/pih6bAC
 RC81gtuVhjSa/X6SbjZ0SZxVyT3RBvCrjjQ8BGtjV8ggj4RXM6Kp7skg7neUX+nVGBDqc0+o9A9
 RhGIB/s2Q2ndtWC9jXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167

On Tue, Apr 14, 2026 at 10:38:25PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
