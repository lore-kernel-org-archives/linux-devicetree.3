Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528193F482B
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427505; cv=none; b=XT9EmkVQGJ7b2hhXfmHRYt0NFxRVDqwXLgm+/H2A/UJ9uDONnTkGk+bhP+QjVZZVjob3Tc3j+L6lQvNxq7A99FcCxwZX2Nr/kDCmU3GyrbBob1NRWzWRFZOmAyHWbYOx2agEn0WLaBcDMj9I9D5ZFAjmb3l9cMEz/pgOtimJBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427505; c=relaxed/simple;
	bh=RiRPKZ4Osm1Mw4H8A9BJtRFmrn18N3a1wk0pyf7knds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIPos6oZrgEVNpK8hxhXSu+10Q0NxCc934Y/548UT1Nu15RGozPg3yJBG8BocaPTWibuA5wQTm3xSg51Zd4LcVoVK+KgWUyivdsUFHEdi3jgzXR2RKe7IIAGuQU3mwxHnoRGpkW4/LUMg+DxBlmaS0lw+2z7M/PgTjPvwI8CpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRG+5lNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtKS4M7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRG+5lNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtKS4M7w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Usa4078986
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p2zs+3Jz7pX/zIdzWNa3k21r
	KY8zg0lGnI8endphEcg=; b=GRG+5lNPD+iaZtxwT0IRTdU6vyDjHfl3ZZ1hFL6J
	Hp8EDzcKTqVa/usHgo9Oy68mlPX4A8tuxR5JbGtIiKYU/Uz48+hj0NMEKVW1kXkj
	Z3qFbUkat0qD54DdjrAlrDUQ2kqsOpz4eoUqHdB1nQN4aExNddWZpcqIDindWlVn
	+kADSMx+myX9qdghobH7Kb401GSZnSnOejdbnX7Ln0p55M1KrASaheTj9UY9lcut
	QwLxOX7E3hCLO9/YyOOTRFxizI/zfs7oIeQ8m/YTXJfOu/hss5Ozb9mx22121kcF
	xt0LACAbXfC4Nq4mVA7XVSNoO6w6/7S7qO23G6ktewselQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdv6dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:25:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso562857485a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427501; x=1789032301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=YtKS4M7wUe358OuGfBcaHqPXqKnhmEH6CodV6nfeiloAH1Ax8CYWnjG6Oq/AFoLjAw
         jNNiRhMnJ9c+S7I7BijIVHw2X8p0Mt0RrEuPzq5JCTE7Ig4gwL6Sy2uhjiJvoqgG8Ix8
         jbt04U5bs7SW6T6z46ATc6vVSja+4jbnUmdDDSAWDEMMht95R5lvC/QG3sYxvapzAaa7
         b+RmoH/G+PzuhNDWzimvJXQes+L/VeTVpE3R/mruu0a8rgtcrOYzD6ScsOpsPlyZA3y2
         DMxz43pce85UisXhQnsx4cakIijOQbSNGxDRHF4nj5hRXNE4wu+j3R2zOCgJ8kl3EK5U
         jijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427501; x=1789032301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=dUA8cWnrF/CYhmucNnchs2uNRxYZmKMA9DPNUgcrpwtlwlX8z4k8+0WFqRf2XfzFVh
         9efQhochNugwbspV3ed2mOwYKXUAZcSV0DbiaETo37JLDZJ7myBQHZxQZC9PYDz/LVvn
         N4+ZdK3KZ85UyyNpBv6CwOEjGFHX17cj+cckMxoQZRJyCkMYZpK3Idi1E4mn1W65RPy+
         W7Acohjx8pLxUxkvGNk2WMhQBqnU7zLHEQa4eA0JMHO39TA4IttDxtU/R59L0ktnioeb
         gRQiQxVmFzsiZ+ZqPen6dOOIT7ONv11lcdSv4FbCkzzVcwWAM8WWWYqcAgmEiwqbAkMt
         jEVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAHdVteP/D81DTAebBtNED/H5S0348OiFjEdufZwaK+kCwO+GS3bTK1ec7VM2Zp7P7YmOi2Bg85W86@vger.kernel.org
X-Gm-Message-State: AFuF++nVJY8RBxygkN/6qa5tL/tj3ZQIXRuTGJC4k0puFfM2lGWGzxIq
	v+HjobLaE33FNz8RV5SMmloqWluDtfS5Bc/hE1Bf1/EL7n77IPjJaWOtQJHTB9gJqZa+PfmA1fH
	G5O/unTpoJTH6f7N33AyUXnmIq1O6+bEuun49hafqdcbd5OC+VO24IM6ym1urnNSB
X-Gm-Gg: AYBFou3FprzzImsrHUSJ0juuqDlQ7p88Y+kpsKj56nmlUfQrEfBw0Dlr+kFZOvD5RMT
	01PJlt8CL9CxzB6vyKZB1mMn9lcwwFIsi8SxWga9y/8UovwDUoUs+NO7SeKumGhqebRU90EatBK
	HgZKr3Dc4kwYJ+UHttHmt6+me7Nt/ROUqW2SvlxCNKIg6dNUsUpJVaGjaOqwanp01us33vgFfxA
	x5Xt2DLrnEQ3MATnYICxhLfTkLknX+uJOSHICL7N6ntE2JBXkcvOpH0L7QIvtVUU3ciubF2iN+C
	ctKIAvQux8m0ZyHqUiJVEbmojUPIWy6jIgLkYl8ZZJm29+32evh3sDPTZLCYKYjbzWZvmDDszh8
	zlx9bqzYH7flL7Q==
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244545885a.21.1788427501235;
        Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244541785a.21.1788427500797;
        Thu, 03 Sep 2026 02:25:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm11791479f8f.13.2026.09.03.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:24:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:24:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <yr3a5y2m3tz65nag45fgt5urdshpxysvopp66chwcjn7l5d5tl@kmvnvtexyhvl>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a993ced cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a2r7pnXXQew0X-Rri2cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: IQKNXg4b0fj5pk3O8hkyKCAB7IHZ7RzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXy5ziB/h7crAK
 zLOMxXcXY+JwyK9yKJ0uy50r4pdkiqWtP1nHRheF7dEaJ7PaUIBINO4ewc/x/QzdaKt8bT192c5
 x3tWhnPU3GImHUwS2oifw9iI5HuPbQOWbyOpQf95VZI+/Cu7cVDPB3A+zfibBImQLJG6Qb/58F3
 YkeEQFqw7sdij/zVqhQZl9pAj4dFnQmj33T7DpketlLtAOk6IICAYYXr1bfZkw7rpoe1CKYoQN0
 AJ1RwSIJSsgHznwAOPgRpn3SGD8IFfII/NTSfNPhBJXyDOQkcogjnEucg9tmUAMvMl7GlrxwDOv
 JCpND2RNi3INccxJbuxEjg3ZXxuQoxZQJwHbdydKxf65iy0fEuyRev2fEx78hs+iZ+hkJaRz/2A
 uOYniI5MpokNirUKRH9wNgGcRCmQb1gw0RO2f2/+yEgvYR/QTPvAHMpDPqoeQORLyn1Z0T4d7xU
 o4eEHW1ZjYOLrpuB7nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXyS0uz/pEyVIc
 T3dgapveyd7ZRyeiM/19IGw4MC6cLZ0m+HVHhVVeYUf9yQTjpDRrmsAi2/2AxdtYSDINCBnTFic
 8LjYXEUQzggvtC+15uMapu1bFNfXqAc=
X-Proofpoint-ORIG-GUID: IQKNXg4b0fj5pk3O8hkyKCAB7IHZ7RzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 26-09-03 02:13:34, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
