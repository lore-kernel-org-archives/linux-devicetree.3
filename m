Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B19481679
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912345; cv=none; b=Z7H0MyLm3PnKUsGIYajLGGyeda5jda+6sUthOJ8p1gcHOdSZTiLFJ1G1ehZ6ixUdr0AINWAad8R+GzGupXIISWb864zwW/22gAZD8nM57mfjru8kuZm6+p9SzzDkKIm5gaslBHufNzBU7ZTl7TiuvMxJS+5PiNle5746Jn9dtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912345; c=relaxed/simple;
	bh=F7xPlX5Up0dNlN3O/LVJt1+uOSHUlkhvPzH88oAA5BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWc+ydAkpYNB0NpnoUa161F2fjglUwmtnnt6CizaLQbYDQ/X61jf1ZzoNEWoSNfOmN0E/oLP85KxxnmZBpyR95JiiV92ViLbadSb8CDL5v2XUoDCDAhI/M1ib34VSyRxE8x/ukiu0/5bUz1Ajq10NEnVqSiInOVOnGbd1DIfrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QC4cQ4Ma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqx8YrXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QC4cQ4Ma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqx8YrXY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8kLu762819
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OEHtM9VnNMryK1PFmC2g6kaA
	Km+UjqsYWUcgciyfgN0=; b=QC4cQ4MaRmKJKpK06C50ldxbl0RezQ1k/DwY82s0
	V8jZjd5cSAbWLUuKj8J3MMxNzRRyIJbDUYim/rMImHN8CXwn/e3nsBHGZaj6uHMp
	S2ypriDeZoVk+WbrPT1yKyq+zUxhdnst4yd+Vy1jkZI8pyHsSbVcxgmWlCzG68sl
	vXyk3PEoMIQy+XsKR+n8Z2WqmP5kl9ab64Mk7DR8Pk7LhVPLuVwfOJxr7BUjqItR
	QiOJT7bWklTlC6ND5HXyZ9fVvSFbvEJqDcrkmYTMsP0yXYhsZDlRuXJM4NgXkp1v
	WSjCMupU8uJs+GxFAjVTIRbqHT4B1rhJRS6taVnQMnqmAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktcc7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b4b575561so90559385a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912343; x=1783517143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=jqx8YrXYQVFC+nuSN8qgd/TseIW3t+X9/+cUOY18EnF8LmnowilP4hB7uylRDCgIh3
         iOQjK31XI+D1AuFdJhcK1qWTzPIkIf+nuk9ZmMy08iMoIytDBTBlPORA39zWHF6pH0Zr
         FiG6jAXvxx4fEcvWowLAAIGVZ+kNvmO/FCtepS3brNjmBBG3uqBALgQWt1B/TmFGf5me
         Shy7yHEZWTM17a88+52w1/i8u8dZX4DH3D7Vu5psLw5t20m2c/WRWG3b18H7HpNpwwX1
         ezFdSZr+jiP5bNP+NQFQAQIFEyntK1O9ERmSk+d9L8GDYI3oUskJlOyf6HM+jMykrNR7
         QihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912343; x=1783517143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=bVWMqVtsClGg3Mg1zp7hAeAWzEYOLWh5HXh7CDXRhwnrc6k+qd9ScjHNROeMXxoPPg
         svXkljmaNLpzmQ6JxKrJY5KrIIxFvU2RCdXo/HbxwCFA986yau1KJMiDW/eoUT3Nt+OD
         XDwO7rjqyK3imJKSVD829XPjToZV2+uDxcHtVgXRRgR1mj2qphKneLvH8PHNERi1CNl8
         U9LPdNnlsPCQmI2X/Tqd9HshNFU0b6Tvxc8yznNyhkbxbsLOMCBLdQT+qeqMdqy7ylwf
         Y07PCxotWx+Im0iQLEBfXlZRR+4h0A29VlOEANo40dK2EIjIzSAHp3Fga1ZyK+2iER5F
         u7rA==
X-Forwarded-Encrypted: i=1; AFNElJ8Am8+73vXhx/T61lGYEBYxp3KedIUiQJNFEUJfyH9yQqI6+2YT2e3h/i5pCzkZdaraBa7LtRfspw0S@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwdf+Yga7F5+rgHiBP5VwwBVa0NdYeMVLdbAJZi0MP6PUCQee/
	oASlCNkkYPG5byczfVLW1Mu1vPEucku2Oy63kF1KTEoDzJ/QcZghdF0QMZxfk7s+F7uBMjiYwvE
	0FuOnFZEYY6kAtf6irWO98z0dpfoGuVBfoex9wHsECPCN88Yi/tTgpPnKrryIaX7D
X-Gm-Gg: AfdE7cm6nTlJcnclGQVBSDLrcD+quMvUgLvXW+EL4ooEGK6UdSDemrRdacYEvs8jdVn
	Zt4QdGRbV8Y6BSHTaTzQxVkLAVlWoFqPnEkhJXlIh/axrREupp9HTxb4sE7DJKHspn544JKm3uc
	Mgv2ZMBjQddpqAmRsxCpsVg9s/kTi66JS12qMN1yDLBYyUHviCM3F8RRSWc+AU5GgqHu1JTMjUZ
	YWiOq8iXLKAsrTWAQSjJtDhbAHnVCQ7Qx3+oFQFSs8q+b34JpFo1gXVm9Wnzkjo7O2rckVkUvAD
	wavuohQ5RYjksK2ZQ9s3ubewzXDzBKZmj0d7sIhOrcV2bRVD39Tqgl7WUs/vlJZU/Vu3FWCSivc
	ul3ln0SYExQ6EOZ82leioB3+CjM7neXzT2ziroAjgPOWKPPN5cN3H8r6TdP2g1fGSh5JQak+MA+
	K0Jnk35bWRtVXf7u27NAEEwpyU
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824508385a.15.1782912342663;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824502985a.15.1782912342141;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b2f70e51dsm4422291fa.16.2026.07.01.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:40 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based
 on received info
Message-ID: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfX2SUH+ANeW8Yo
 RWfVkWo8K+27DFJFEcSNwfxkzjfYDce+jOB/sO27FGy89UuccQRUWgi9fgTPIzCKgNfxBDCAOo7
 US5cEd5KNvG4gr7fsANxTUzXPqw03jo=
X-Proofpoint-GUID: Rvfn3KHUKnMYV5ryrVf83uzH0XSaN7_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfX31K9AkIG14dY
 pKAmkB3H1l5Ih7mWGngtcJ/tvDlJ7xbVfZQOA/a+pznoGfmTVpcnXhG3ctIBL7JPO2t/EUXkZh2
 pOJ7iogcZGUj19pVdOR1u7VcbGbDvoJUUP69C2uU6Ek2e75ZxrSt/mKIn5ZVcu5PaoREp538eMU
 H2cJVtanw12nzKejHAA4jr4hmipUZ/wxWtz7VxouyhGbPw7rbEoOevlqFKUhkT0Saa+IS4f3m2R
 z1wqOWvkF/pR/k5YeELSM2KJYlfgk2As0j/gCr2gCBmTfR0oH9UYmMKcKKW72l+afv+eUrJ2/8e
 3IGXbk84YsF1FWS2q1R+BZOy2WSfqJeDg+ni1y7kYOrjFF7BC8SbnXkWq8NWBz9cjCeVdZDiU3P
 XMxKvsT+qwxXnBTjiwUMO68Rg98wvclbts3QPpLkPhpXFfW9KUCFiVRhTMw87bEiQxHKeZ8yc9b
 DYFJSYvQEn+uQqMHAuA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a451557 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3EHR-On4ZTnEfFEao4MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Rvfn3KHUKnMYV5ryrVf83uzH0XSaN7_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010140

On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
> > driver should update buffer sizes and counts from the received data.
> > Implement corresponding functionality updating buffers data. This will
> > be used for upcoming support of AR50Lt platforms with Gen1 firmware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
> >   1 file changed, 74 insertions(+), 1 deletion(-)

> > +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
> > +{
> > +	struct hfi_msg_session_property_info_pkt *pkt = packet;
> > +
> > +	if (!pkt->num_properties) {
> > +		dev_err(inst->core->dev, "error, no properties\n");
> > +		goto out;
> > +	}
> > +
> > +	switch (pkt->property) {
> > +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
> 
> If i check the venus message parsing logic, it loops through the packet till
> it hits the case.

It doesn't, see hfi_session_prop_info()

> Here, we are assuming the first packet type, in the pkt to
> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
> multiple properties in the packet, and if
> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
> would break with incorrect buffer sizes.
> 
> > +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> > +							  pkt->shdr.hdr.size - sizeof(*pkt));
> > +		break;
> > +	default:
> > +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> > +	}
> > +
> > +out:
> > +	complete(&inst->completion);
> > +}
> > +
> >   struct iris_hfi_gen1_response_pkt_info {
> >   	u32 pkt;
> >   	u32 pkt_sz;

-- 
With best wishes
Dmitry
