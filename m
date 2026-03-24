Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ACF352921
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387643; cv=none; b=ApdKhX7sT6uh2/axUNTSie1RayXVpBncCFMF8/63P/1BzScWCFYz2xaqopn8n8HtgNt+6NJ3WD4v2TBv3bAvlqK5qeMGbv1d7eEIHclj5lOhSHE9yhAa9i63nIPvNY3PwU0mRKQ+tFVvt32Ukim5OSEIvLhU8aK5Oq+FphFxYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387643; c=relaxed/simple;
	bh=oUFQ9sIF7fKPX0a5zGIhmqfQdn2/Vcoqm1/nUEgvIso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srvfR8m3hVlwps1NL4/1FVb4IE43zxPMNromTZzP8DQWRtcjpY3K7wy15PjUMNnRvHshtZk+aTwzsbWf0r/XI28daHpckCkx3hYfSB1i7LkiG0MfmhZYvbbWqLiS5s4RcUFbufkQ4/fTKDby4CN8UCGRTxk6EuhtoQw5QLm8zmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kfi//mS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP2kYhFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kfi//mS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP2kYhFU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCe63989015
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qj0REh7yFCsbXeGvGp4+pn7n
	G/Wi6Y8obBIN/fmlGhg=; b=Kfi//mS+7yzdtBk1AxRZ/weThhpS49Cad+JQRWYS
	WXs2xZN+wiZPSMFwCC1Odh0XnTr62l0DPMXwF2+TvBtqQhWHDbh9dTulwvgx7XCv
	1lhlMvI1R5ZNXmCagFbmOK568yH36kjtzvgMdBjOjOpzwxNRyiR9f6gUpC157yWh
	Bgjmz5yQLy2/2dtuVT9wfMqx8+edAM0pyHczOT4VsUKlt+ZQkSR9CXxzMjVO0wiH
	MIYfOTsmPvZ1NDt1t1t4SRYzWGhBtC41qZHSw6cj3Mlwd6jBVDCYa+6J3NN6y+dc
	p0SRs6PkNUf2umzneUuMzPJKe1m2V9rFxZlm2RdPvsSoTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m1xb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:27:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso304021871cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387640; x=1774992440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj0REh7yFCsbXeGvGp4+pn7nG/Wi6Y8obBIN/fmlGhg=;
        b=kP2kYhFUufva6e0eIFWt2iIw5tu0P8M/RsNBEHn57DSZMRrH109imHfFr8hGuWQJK5
         56XGJ9U7X8RiCHS59GEH7X5rfIHFa/c8r5TtdW5XyRXgw0T4xEkeoPD4o1CLM6AkmO4M
         Due8sO50Fv20fA//3xju35fupLVmvBXylkRKvcfILyrifFIeMsoOJgOziVxYvPP5AkZ1
         dKJK+/Kc8xqhVjkWjCDgCXg74uIvFQ/aeRYoidWpoo57YLRrEE5MIxsiYjWRJrmQ/Ajq
         MHw+EFPly0PJCbjcAQWkqjzAGV28f7HqpBESV5AlnKn6bUy6Rn8MPFZQNjFKGAAJ66K+
         INCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387640; x=1774992440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj0REh7yFCsbXeGvGp4+pn7nG/Wi6Y8obBIN/fmlGhg=;
        b=k3ICBElgZmZHBww0BvYQwmVTgK2SZv1erE2Kew9EHfMBsCaStpEBaeaJs/OHfpyAk4
         HCXbLqWNjssCncIqqMEnt9Ihuu6BqRL1n5wglUQB9C3nH1A1RkGDJXyKmV1ugT4HaQeB
         1b9YSEi9vi10f40l0C09nslcqfssNVT1CNSuR+BOWJOeXdci+RqoP4mB+3uEos/iNOvZ
         kYjMKiXuwp+UsbZ1qsPxpkPZl8ll9V/3OKGJfqT2Exzdcooi7zWfN+kP2YwoG7Ydbm0V
         wL8YvIzgYFZ22EXFV9/F5AYQcvSOZmb0dcIQYAdhK1jfZX1X/HaWS25lBkJTPWww1E/d
         rpmw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8OAAQ4NfSEfRAuqTY1ZoapkhhtmYo/LibIi8h4wbqEy2aPU8jXYYOuTK382hy9slKDjD9ZbH2ZtR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0RpIzVSw+rSHAXYfRHo8iK8OyvYF2VNb7lIPF9iYa75XwRT3Y
	a5KTNJDHlR/nQIPl3bMUcZNtWECVdD4izxD9GdWg8EQMRgpD4yxnhh1g/TIAWcnPc6DbkY5lzvf
	Mthap9vhQljdEXQ2z0pKoWtSm+EWKre/0A9BORFDFK/aBzs6LN3/MHAGH6Lbfj2JN
X-Gm-Gg: ATEYQzwUti38EmToHuDFUzaaGJy94DbF9I6+EvY1Lx7H2WH6gzZzEpPHgW75YX7E2Z+
	zTFLjXjBgLRwYX1pZ5BT8qxooXQXUKOZMrUaWJamFRGVZn8EsD427uWKFgW/6JJkx/xKb1hiWiR
	jJNtE1YdznRDpSU+CjU2186I3FNhzDdGEyC8LE4S6lW+1QS2t1Yt/xkfmNs0JN0n9/+VBEFWT0w
	YlH5+R5GVEo8sxewYxNOf68NcX3cuUR/V9F0G1KsksGSDln8QyTDAjICqcllFXSLlc4dKVNQxwD
	nUZvVYdcuoPT+dGyCJoKbyA+aCisEQ+Oi5hH05OjrggfBvf4jyu/kitiqV408SUd9eDZMvqOQAE
	+dq8ti2yw8rgAEsmLQRMZm3YdRdHTBYxM6sTIoIAVR8KWf5IpFGt9K6ZK+pXzdxlfGw37zW414A
	F87Jzg5k/BjeivHXx27Doya3lrcVtu45e+600=
X-Received: by 2002:a05:622a:5e10:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50b80d89e4bmr18668931cf.31.1774387640405;
        Tue, 24 Mar 2026 14:27:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5e10:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50b80d89e4bmr18668661cf.31.1774387639965;
        Tue, 24 Mar 2026 14:27:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c3aa03bccsm5014921fa.17.2026.03.24.14.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:27:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:27:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c301b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=l4Carxc1wWiaQxiGSvMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: V5Jr--Q4QJTfK8-EOB2SNfEMwkY2nv9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX9EqOxWGDyYZM
 HRuSdlQh0rEtOVi79m1bYib7wpFSur5HXaEQ0dpXK8kqCvedRx93ivD6dWCjNE0QE7gM09vqRM6
 +2mmyp72P64Osa2lsWefYmrBOjawprpQ8ARngireG6dtub7rCiptzaCF3/4HetaQM40WXgNfsRa
 XRp6CEgIFdYQz6JwmpBs9FbYsvMsmqhohAaaX8b3aoPnRKm4sDdTEoqFTCoja1Q9SzFKsR3TZxK
 uDu9JrbxY9Pkau9dj+wekovFnI9LfnJPSCiHQAos3YItrw7iXkISZthafCgDZwBIIlNJ0QnoXDG
 J8LuMz808y740j6+EJCgiSKfk/QLpI+nLD9dcFgiGvpZsfTxBsdiqckqOYtTIGeqx+iziJX0kyW
 r9P54CEg3Z9kWpu9zclBFc3A6owrbiiIuXnBFzMWNPynxY9Dba5Wvx2qXYd6J1jQzNNKqNPkI9m
 5cAUHzQs7hTKdxwg9wQ==
X-Proofpoint-GUID: V5Jr--Q4QJTfK8-EOB2SNfEMwkY2nv9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240165

On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
> On 23/03/2026 15:31, Loic Poulain wrote:
> > > > +
> > > > +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> > > > +{
> > > > +     /* Fixed Settings */
> > > > +     ope_write_pp(ope, 0x860, 0x4001);
> > > > +     ope_write_pp(ope, 0x868, 128);
> > > > +     ope_write_pp(ope, 0x86c, 128 << 20);
> > > > +     ope_write_pp(ope, 0x870, 102);
> > > What are the magic numbers about ? Please define bit-fields and offsets.
> > There are some registers I can't disclose today, which have to be
> > configured with working values,
> > Similarly to some sensor configuration in media/i2c.
> 
> Not really the same thing, all of the offsets in upstream CAMSS and its CLC
> are documented. Sensor values are typically upstreamed by people who don't
> control the documentation, that is not the case with Qcom submitting this
> code upstream now.
> 
> Are you guys doing an upstream implementation or not ?

And there are enough upstream implementations, even coming from the
vendors, without (or with the minimal) register specifications.

> 
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ? writes by
> the time we get to denoising, sharpening, lens shade correction, those
> writes could easily look more like 100.
> 
> What user-space should submit is well documented data-structures which then
> get translated into CDM buffers by the OPE and IFE for the various bits of
> the pipeline.

I hope here you have accent on the well-documented (ideally some kind of
the vendor-independent ABI).

-- 
With best wishes
Dmitry
