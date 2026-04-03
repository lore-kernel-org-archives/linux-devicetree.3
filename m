Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0A337B97
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247957; cv=none; b=bJy81f42wwYJZOO1m0KZ7lnsj1DuobPR/na4xNh2KE78Mldp+ENAgt+uvcXZMJGO9KgbmblLfylOB6LsPXMlfj0oQQI6GdgzJYtDjQxUS6PYhyetu6Pz7uF+XvDy9bMzttFBhvceNHkNGZaSfQuseN9JbVua6fdpBPiPhKHk6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247957; c=relaxed/simple;
	bh=hkhtv0vLA94cjZgayqZZKMvkuBiTc8iJOFDFWXtoU/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVL/O2lHHfRh2YqCuHrtm1Wu83ixV5Z1tZdcdEH+BUM+v+FiWmZVU4M4ynvNWV25+oINKEKluoLDWNpCpe2zkUY1lqsZ9RsdVlSyKcEiaWEzX1zabWMQzJFjj435OiJ+P4LmQ8pFd40sSuUjHbgtOiIpoJ4xnPyy5O0uuYwj4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsYHRJLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UABnrEG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsYHRJLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UABnrEG1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EZ7rh142094
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CTmunhIXm0C0mo0B8v9dQ5Sf
	z3cCZwNpzeQtGJNApU0=; b=YsYHRJLIA08W9WkMy6AsSWuRkJfQa0mQ3jD9n6H7
	KUlamPz2juaeSwjbI4FP5pBZXHh+h7bV44t79yqkqj1EODd9p3Nc6OkjSpq9/qWM
	ZlIEEM42TBsqUBIh8NXws9XsNuQcyMEuYwcDa7lqAaQ0i6b8EAqcwml7i6BAuPRM
	0jdgOdQYeFVpNa+bWjcN4+rtMRZfVHLHv5+TmyLt07jIsSsAYHk3p5M9F0EdFLVS
	0jMwV5mm+7fBq/0JfPXJ/xzaFrvz1PVCq+GERp0YU/LH3NfH+tUU3yYgDGCFu2hc
	2nHhmvOYsBvTmDzB5eg0iWXCjhklanAbdK7IyCFe1fg++A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y29se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:25:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso64224931cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247955; x=1775852755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTmunhIXm0C0mo0B8v9dQ5Sfz3cCZwNpzeQtGJNApU0=;
        b=UABnrEG1r+0DSY3M2vejMg2+XTbjkX4keS7ZazP/7pDg6ecmxtlxUQsyLxoC6AQYtF
         S9Zp1KznJ0ugDgdVWb4sjJ72CaE7ZQDEoAsO4rgcg3wWN56P5M4aS3dr2a/GGkU+Bzb0
         aGYBQjbl42MciBPgENb3mXxQY3A+TXOKHhbe/Eu7lOqpc57+2i2p9VbasF8/odfYzor9
         9vxIhYyHS5Ij7lxaWxq0g6yOo8xi8J5xw9zHM2SUHPUtNUM1vPmg7rOax4L6qvp2Xe4E
         zlbOJh3JoFjzV9DYscJRJ4MVEzKd8e5a0C2w+IAqbPsINqRETOgaVpKIjFm6sa3PnLJp
         Cgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247955; x=1775852755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTmunhIXm0C0mo0B8v9dQ5Sfz3cCZwNpzeQtGJNApU0=;
        b=pfbT6OI20UC1Q5pWAdporYVIU0mI51PPYYbtCKgibH7RdFq372Vpo47QRveBgE4jt9
         pP0nqW4PyCvJkzdY+wsZu/B3LJtcF16f79/+Cv+gAag9jBEe0vCHHmiHBHAbiGWuwdZv
         axVBECr+rJdaBL5R7LzF/7q6P0uv1Gl/faq9cjv5cFJUHrNVRO7KAcZ6jeKmZtH3ZELM
         zY+uruVN6qO933R4xTJqloB5tpgMNkqPH2cYM3vGAFdCoFVu6Gxr6b2Y3R0QGxHMzK67
         ep1kE21ITL7oPwlQN+Spty2mUFkl9BQqaAtdBcLDC2uwVfE5K/LtiS+twi9NwjOYNhkV
         SOzw==
X-Forwarded-Encrypted: i=1; AJvYcCWCI6K9PoMsan9HxYKmxL63p43yGJRxLOHkvQ68Nd20pn7Ux7ifp1CeOLMPwQORm7yUcTr86ATAJbYL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6kStaTHcsNjK0ZLx2guGPN6DN7UdJkFw+ftyXgHKjT8GpauJi
	l2EbP9pj2XsL1ba5bnGWFBYJldMwQPZZamOrX0F2Z2ebH5Ctoxi+HcWEo7s1WiqLF9xCl/IVwOz
	LedI7Gzy96AxtyeT8d9gQawinwSyVl0a8Z9aZxienjTsTyRfonzoyJwckLN2y134n
X-Gm-Gg: ATEYQzy9M5XWFqp9DRAhwf72hSJ+1bFVOMrsD3pb/zUZ68UH8u99sHUeioVwPgjxEt3
	WLME4VVBLLQUHqo31jmaxR2zfynxLXamhlF6+HbublbaVjqq/HM0ipeKJPTbMz09anPNI2f+g37
	nYEqyd3Ln1xDCwCEjCxGqR+g2g/q7ZxYB5VEwLJMxMbWwgUUij64iafrHK6usRlEy2qdxs4Fo0e
	n0wJO6/w+X+axoWUk5jB1bRlTNb7y0OdyS6tD5OpfLSgqFsahakmMKKj6JDuvVc7KCpEDzauBlF
	MDya1PGmgkqwLG8Yk4kSER6Bypo2skJj10hT4xS9D+dxr5Y+7RgO5B2IO+jNhIGmFZPzusYTM8T
	0bXxrxpnJewnUBqcAc+niRrhA3wqs29JRDdEMakmjwHdan/RtiDd2UBOPF8tTW1BBeeRVSN7HWZ
	2Tnw66wFXhGWmMAJ420RWqLbiwAcUz+et7pGI=
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr64612751cf.38.1775247954875;
        Fri, 03 Apr 2026 13:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr64612541cf.38.1775247954489;
        Fri, 03 Apr 2026 13:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd21076aesm14487311fa.19.2026.04.03.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:25:52 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d02253 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Y_bj1bYQe2qCW0vrO7IA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 7TNMKXL9Vvnemz-okd7hvOB8c4KnJGgd
X-Proofpoint-GUID: 7TNMKXL9Vvnemz-okd7hvOB8c4KnJGgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MyBTYWx0ZWRfX/hEV9F0Aj0uL
 uPI30lP5kqA8YaS7pWWYNlUKZKb7mDkBBGTbS2S7WlMALLKFf5vO1OPh5/9Rb33PgG0ZVgqilWm
 bpw1ox6kBDQ3sp6g9qiQang44BM8zyFXgU8LwbytJCJTPMfA0lw356zaBOxwybX336C7Kfce9Ht
 HoKe8iUtZNclN/EK35GOxRHz2TzXnBH6Cqdh89skOiynZ1Nkbr8WQK3BOr6Q2xjpicqmZf9twiF
 LKMurtQux82herpYbCumourGPKDt0wyfou5G/bjxbY/rMtflCE87VcJOWJqIBufLE0KNq98odOj
 A+YReOLahW+BLDHeWE/hVOtY9g+llNcab9jGoxb2kwAeG/aY3Vt397hL87PLL05Tb3jLmXwusD8
 xaScJciKiw6AnJOS2ux1vFnPZuHIGWj5MNv8dRiriJd1JFqnRUdJTavOioE/+H46YNNx3ud12Sr
 d7d9bETTvMHQC8zxP4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030183

On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

Missing commit message.

Also, as this is adding SocCP, can we get pmic glink device?


-- 
With best wishes
Dmitry
