Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60293BFAF7
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227379; cv=none; b=amLzOfPmKxE2dGywL6akRW6ItRDvn9RZggNOLU1hUtKGj91MvJxWbhM3VmZUTUB1GLHuDNkxIxb4UhOuioXSkfyxAnmm9KOmxTbhP0IquJm2OD8q68Q+7UsWL6sgdMsB1ZkrbeF3Y3wTEGYrhe8jEzuKW7cO+7Ggxj5ipQInJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227379; c=relaxed/simple;
	bh=Vbi7IkUq8B9jJRh3qR3TUtbJMUTUcNg7QdKscRxEt2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCF49PqIqwBTI93eg9NcVR/mhyCN/uIRQVlGuLZxmnRiVdHCerAeCp48qgRJGS7AbKzdPEqaDEpZ07CCkRWwlqhNVbDn5Po7jnXSqFLQM0oHodzjUx6GR/weKX7lqNt1XYmr91nFxCewALdtDFhzY2IxdRndN5E/dWVsoo7EvJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHMznqns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWoYF3rd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHMznqns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWoYF3rd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe2G12607628
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=roZxxF1LIDrEPc1y7e6j2bdW
	NGZ4/WzmFDknXsKKMIA=; b=gHMznqnsrWJZ3zYAs4YpNLJvBspU0VtzW1+j3de7
	7ukaGGqCXy7dqH8mcLd2ZVCoa/R1vrQBqfpuGhWDt/etox1IvM6wb/PehnkCnZK2
	NLeMRFMI9EwnH3y3zk4Ch4Qs4d8a8/LH/ei5YHge6gFMOjDeFSysGu4r0iO8D3g3
	FukJIJzzdwUGR3ySjdrDvB9dUOsWlIGdgnCpKlV+c1dqlDY5ofcKLhyN6xfzAjs/
	kiiQMcodfJPaJ5Sv9GbMynnXkpy4Zf0EtUvk6AGkW2k0mPTG/9ry2j2FDaiRur5B
	fT7fnMc/9Mkv9zUFIuU1FF1kWf8kMdbJ/EAa6P8V2klpeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c98w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903982af1so466142985a.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227376; x=1789832176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=roZxxF1LIDrEPc1y7e6j2bdWNGZ4/WzmFDknXsKKMIA=;
        b=ZWoYF3rdCzoxpm2qg3DgohzEc8jTnciO7b71QnO2HCJsa3r83VCReFZRW1LM8gzNO1
         tzTcLGa7ad6vqBrS8k25JPhmE0ccBwVahBTUveAKpF4gp9lbwJtHqLFE71jfMhVkc+dn
         2kb14wP7QxvWlmmrE0sdKuihg9MqdRBoFDJiPuSB86C1bAddMwvSCdMWtGpk4JeOivqr
         Bcs1I2E+11ehM1/x+zFapqRojn9B8b6Qszd41ezEBD/jkH2vews5p6M8a/TViWD8T/tU
         Bd7IiEh2Djuwbky8KiS9IIY4sm60oqSabRP73Hqcjuo8PlQGu0B8CKjZYyJwBaBCiYbi
         wJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227376; x=1789832176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roZxxF1LIDrEPc1y7e6j2bdWNGZ4/WzmFDknXsKKMIA=;
        b=ScEKuI7gA12RAdmM8EfTnJug+TX1KXR4EM8MXIreQ6FsospmvZQ05SVjMJN7xF+ew7
         S4x+kmkNCOc8154mzUpUQiwYzz/agYbkoD5Pwevg77wMDiD0mWzKxKwq+w13CjTmwxnb
         WPPeHUTYWTE+EtMmjI/v/9ynIYtiKEdBwHtABumtzpFoufMseHqjTf8mVwAoO07wBZHa
         1PzIwEu/vyA+5ypGC2qn5Hjq9R7QZPhqXi/XXE/4VQ0oW0JAtyj4eIhI/6mZhMI4RrsT
         jAK51mBZ0sOuuYaa9EruvAbZHVw7S7+IlVqCFv+SNUalKLtyRuZUhWno4s2+C2P9wbCm
         VuCg==
X-Forwarded-Encrypted: i=1; AKwUvBxSVke7IOhVMT1p/pFQKQGHEHzvG+hSSOPs0DLoCX1+FFC99Loo5gWA4DE7nzEPyXMC8amEacRN7nMg@vger.kernel.org
X-Gm-Message-State: AFuF++kodzo0OX6Tfc3/bH5dj4CHsMxqYNLHU3UxoTwPc62hbHYyBFXr
	wMzOJaJwcJdQo1yOj04OxBzBHqcQpD4keP4ocTZ0y5MRMfY4PyE2OmjFqKUgufmxH1ReKcA1VNI
	m5zlsRMqUpvpHbep+zBZq45qK6JYGP3fkFz/TpT09b8wX/jgHSl7mQiStAHaLUsdu
X-Gm-Gg: AYBFou0KKUmqaE4dJrU9sETae0s8vrQh6HlrgsOrKZ+jIve0KMW1+X8QELR5TUK8DkI
	IQQd6hhe5zkoCDa48xQkDsQwQ3cY0jIRycv1OIuDqL8u7hHGvm1EHPvwhm6zHZAsnfvoRu3hSxa
	oRzxchMY7A2BRn1LHE6xNryK3/IK1DV4Xso7UNRYtJ4LHM2hR3guiom/pqlXA4zM+tY48XBahca
	Pf1CnsXEZ9/P4z+UmqHGRgqOGpWnHmu+DZ+zHujo3AWKI5mTcKOoR+CDCf5s/egQR+g+V7VkErx
	XtvDxa+Ngab61WzK8u1cRlWO2UmqzPCMj+qH2+YlilSelGwBBhWGa6d0C9iJG4syU8cMawhK5Td
	LbH4r0iYgIYGroYQ=
X-Received: by 2002:a05:620a:4144:b0:939:8d08:9244 with SMTP id af79cd13be357-93a03709296mr444170085a.25.1789227375914;
        Sat, 12 Sep 2026 08:36:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4144:b0:939:8d08:9244 with SMTP id af79cd13be357-93a03709296mr444164185a.25.1789227375408;
        Sat, 12 Sep 2026 08:36:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm13666987f8f.28.2026.09.12.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:36:14 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:36:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Message-ID: <qkoevqddlypqomyadf74jbd2s3zoouinsnjzmpj76rvzwgpyoo@ov7yyratpvmg>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-GUID: oZAtKHfmS-LzJoCrvF3WwoLiw0ZjjV_p
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa57170 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=s8hspuRcmIiiD5yHkK4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX3tpBM2gBBmlt
 +AJnbKeDxASnVu+hBIZ0vtxmErBqrf/YWPmmDS0Ep1c4wO3du6FSbA6t672ChBcC0dt7Mpx11l6
 AYMFla+R3r0cDMd40ZMuG3y2omvzRQo=
X-Proofpoint-ORIG-GUID: oZAtKHfmS-LzJoCrvF3WwoLiw0ZjjV_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX4xxEojcP4SG2
 V0+NUJ1dUDE9YCVdScwjYDSYWEFHFrNOWGh+pq2IhUCzVRCrYsVafmnWj2/WTXmR+wX+EQ3trXK
 u/Aqz95+VNlwjrBUoT+xkEIsBNKBVoIzWYkt5QrgbQMWqi13BWkNpMOcliblEFIY63KVrsNXnPm
 fHZe3MWzpBBDr/H2ptHm9tUHLA4duUml3b76KRZm1NIHrnfJ/m5o7Ackp+ne5OEEcRTxcRZexs2
 jwx51xa8ZEke7Ts350Up8lXqt1XBdCgOE5W5ZzMERdsq/hemt/r7gckw31qcOKj04+oLZULogaV
 ZGQr7xAqH8KqOr8aGH4Wts5letEVdKHJ1OsR5EOSqzSKxlHlFh4sgq2OvGhQlrFOuYm+OUKPxQ2
 d9d9CEjd8ea5cM4Et8AuG65OcR6yCEmnjDe9OFjcpqlgZ0OkItjkuXkVyjOr7fdQhBNKNzjY6uv
 E0/ykN+xDXiqzg6omOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120226

On 26-09-11 22:10:41, Jishnu Prakash wrote:
> Add ADC channels for pa, quiet and msm thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
