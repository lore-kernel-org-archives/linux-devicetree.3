Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686203242AC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867373; cv=none; b=TNvpYMwU/JQhr3+AZWr3vIS1Tw+80G/X3uXDhZkdagVtIsF2TD1NdlCtPBYtWIL89vMhY05UdLCD3EYG8aG5hgAlSx0snWJRU4jiDMKC8rsYp/NUBgi3C80sL+H7BumxTKewqctvqXQpWJxLcUAKUznK3GqMJGXLAJxXAxNGYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867373; c=relaxed/simple;
	bh=l05V037Gw6KDgSPeP8gkXt7VLb9lUOoSe9YYff0dOgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vnqy0UTPE8VhZu8EdTSBSSoskyrSNz4J9zpOE9SiqDY0HtQ1Y2AlkrxwgLlzMFKz1cvS/nhKxZQy0Ih9ab09XKzhlRsFBJgYmxIRJhqiCc2zGEDmcbHiHaEsOTnSD5F/dfSITBaseuPzymcHvwCp4VrQseDNNHCC3DoU2uAHL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AP2NH6Eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsW9NE/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AP2NH6Eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsW9NE/M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfeKZ3643783
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 18:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TPVZMaTFwZtDtQEYpIn4Gvd6
	nK8sND/eW3Vwfn4Qax0=; b=AP2NH6EuRJiQPVIhRJPuNMYbeDaUiKsFE+E6pBk6
	qTJx6goyHVwbXGTh2WumxjE/ZCgwZmmopz+wNaMhrtVha1Mdv7H7WtsjDcapF+TE
	z4xxHZw9seRdc5rF/F5qRjNIu99XLhcy73O7DPbY0MApPn87U2FWg1tEy7fue7n4
	gK4dheoca2Tkved5bys1OGrLK4ZLnnPLmL+/5OhLbr9tUZ2YOMtse4dP/uUJ9MvF
	/1Xdq0H7ew9CetnCbAmWQj9ikQtFhioIwePwZOSU52+zbcE75ggUzcJXKpOqJ/cd
	8+ZeS8FpDk1VBnp5cYqj0buCktii+bwgWlt8LAezxoFBCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23jfv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 18:16:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so106717a91.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785867371; x=1786472171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPVZMaTFwZtDtQEYpIn4Gvd6nK8sND/eW3Vwfn4Qax0=;
        b=bsW9NE/MfC1C+f52OcuEoZwAP4ytKcLJ+rX4IxZS2g2ZxoIPuKWxEouWV0pyE2Qlr0
         C+Q5NcrPQ12qn7gVHYSof0z+oG3oEMCklB9CtBnPCzRdzTZ4xTAUz4DMk6OOZSdE61BP
         bjz0dYCDNuIMu9HFaLEcCA0SMydwC7DSeKQCaTdKzmbXzTcv9qLcoDcKdkkaUyQ/tKh4
         Fr2+a/wSy5xGixtlcRcy/NDjj4LFolfs3KQv1mmxKtpPEBrx2wnp59HmI+AxNJdDD/Kq
         uO5azOr48rhblfICJZ3GDE0hn22MJjgrZeSJ46oe2xPhQtqkR03cpYO4E/1ZPlIlcmJL
         c2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867371; x=1786472171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPVZMaTFwZtDtQEYpIn4Gvd6nK8sND/eW3Vwfn4Qax0=;
        b=XMznRk+c7bZoqHYQb0wXtcfNyp1UBJdF9UkpJ3PndpbIx6O+cQinApmHPoiIayTdsd
         fcS7kNefONnaGQwsOm0pJknWUpIJtwX8U+Pj0jwpRQIMtJQoF8phcmsCXcfIbzrBX8Oc
         BnzR4bV6Yk2CNsF5QqLM8DJrOHHSUSIXsQpJGMCXDNSSSzZbPlzjRc74gpywUrh+iBGZ
         YDb7QnRQJ+TFfAvcFEJuZglW8fCHtsPnPdR6IRL9U+L5DO5aGwSJWXiIg6gxNhgHf/Fq
         Up5HnztF1pe7eY+ehiguYEX377ox0JyTovre4FlPJiCRsTjx++uxHDxePOBeB/YVrp8W
         ArBg==
X-Forwarded-Encrypted: i=1; AHgh+Rob9DQIoQmKQ9cx6OS5x4COtLnFeOuMhyukJBKaFQhNG00qA1gzxaULEP8aIheCzQnI3RbIaC7EkAnP@vger.kernel.org
X-Gm-Message-State: AOJu0YySTdOxVFQ+ZUTjRA3LJ6QWcnytQ+mQVwWrWtZATDncxecq1K1+
	cAjTiGJULkonioFPr3U7EtI+kSyk12NKv4+/XVftg21QOc07nuzsOyKoikH9e9u7i5SEkzzZwJc
	3Llv9CIbJToUHBKeyK0sssDIIFZNp1NylrTf1IS2mmGv1hRIZfIYYsjOtQNr9vfT+
X-Gm-Gg: AR+sD12sRW3S1rY9j2j8kAA6/Ig/BEKo4n3fBKOQxocExWlsZcBjuyTwdHMx83H+TEu
	H1KlDXjNDYYZVsuAVU7OBsFNIDnum+qMeDbApxocFxJAduSuPlEJqV8SUiiWANZKueuAdOGXgDW
	HT/6cRzCQZYVX66rhzgOaAiaepFU+NF78pUQ7OXtDt1xGfRW2EskLFg7pEA2dRDzAWgIk3jb0kG
	1P9RpVFx/P4UNZMBg1wUDhr9vhYBjAhzno9XTrqi4OHRGkevKWzxDJWpK4PImcagofvO15hZqM9
	NA39uxf/Q0yvosiAF5gLOMmXOJc7wsPHvq/w+hG+sKOJagSd9jIGDEKt9yFUylSunVA5osWtpgs
	fLOHEqVSbTABLNnD8ers+0DA8xbU=
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr584488637.12.1785867370930;
        Tue, 04 Aug 2026 11:16:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr584422637.12.1785867370347;
        Tue, 04 Aug 2026 11:16:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm11267932eec.21.2026.08.04.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:16:09 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:46:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <20260804181602.g2tmskh64zuvl2st@hu-mojha-hyd.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <20260804-acoustic-military-coua-cb0caf@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-acoustic-military-coua-cb0caf@quoll>
X-Proofpoint-ORIG-GUID: 1bQcFfSAL7hDw_Qv8Ef_aiIu-DG34zBN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfX06dqIyaa8ePh
 xSxPl2dn840IqOSuT+aRWkNwrRqnOATwEEn9EqktriY7HFqFSQS7837M3eejYzrOBtLK7gZMC3k
 HDvWbxB3uRjfgr6yRJVto34gCnJgntE=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a722c6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RRksG6cbm_02s6OBxpQA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1bQcFfSAL7hDw_Qv8Ef_aiIu-DG34zBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfXz/qavjf279F8
 Ff9aP17VwLmfKJh7Qv02UJ/roAZrqVlOnIzblmMTbKImfvo7hU6opibZb+Ybkms2TJDSC9io97/
 O5sPWwtn36ATCh8qnItBJuhjCPBisUWkT+bpbVUbTnhLW6dKfCgFQqhJHyOP7CIlS+HMkHPeAow
 bdE/fLpNvQEM2pK3WgSObSjPA4EHrBoCssjZrEmpKMRM3HiUjDNoRe/k6lHYWV41Tyj1vZSs8No
 OZx0/n/rJ6f/MeaCUI0rHdadwRbyezgGdRJ12DAEWOhdARa5VZFzhpragsimqLj18i7Hh8jR097
 bjo2MCcW2Xb+LTg0ns5oojIiNINHhtpluaOdommwh2pQhhDTtbLqWeWWuofgChOsYedxGpIew4t
 1BIubTiIYDCLqqtZTGD4RU1s4E9ed3B2gxFFYFMhg1lFDgXvTp0OEuq2GxZQp6V8k4A2gYAlZGT
 khO86B0jvtjWWIuAfiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040147

On Tue, Aug 04, 2026 at 10:41:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> > SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> > they share the same set of interrupts, memory regions and power domains.
> > Rather than describing them as standalone compatibles, model them as
> > fallbacks to qcom,sm8650-mpss-pas.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index a062188861ff..f722c55aadf4 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -18,9 +18,6 @@ properties:
> >      oneOf:
> >        - enum:
> >            - qcom,eliza-cdsp-pas
> > -          - qcom,hawi-mpss-pas
> 
> There is no known user of this.
> 
> Why do we even document this?
> 
> This is unfortunately one more example why I should accept early
> bindings without users.

Yes, it was a miss and wanted to send revision of [1] after Yijie comments
I thought, I acked his comment somewhere later realized I acked his comment
internally.

[1]
https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/

-- 
-Mukesh Ojha
