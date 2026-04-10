Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE17B3CE48F
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836568; cv=none; b=aLK7mRN7jyB93d09Zp+MKDjD93/jDHA4il/vU64ouxLy/5iC0UMNoSYSgKanPC+6n3AgSrO1NjcoPH+HK96YeypJNOo9XWdZ2CY7Crul3PnUUYnaJuy3TKC8uu3XuguJGRrE054Tzj/z9DK75AfR8hvQtMhIOA6Xt8AZZOjGPsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836568; c=relaxed/simple;
	bh=+GZuJTb0iMsl4BoZhYe3y3JxlxvYISX/fuuX427Ffto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ypg7kCM5c4R83IBrONJIdvNKLoRPV9LWkATT1ax/DGySZ/2uyIeiY4Dn/ceE8hnikeeWP3eS7XENzeRprrSu59cFzrtcVNfvzf+RBcgZ+rBhbcA8JwcoT3VePeAhezbNhYxdm0jGbn7AJZzxlk1RXFMdZXJ47btdtvUKCBuEBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAHpwEbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5Y6T+Gv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAHpwEbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5Y6T+Gv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1Rgp1322642
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azMtyWroEh5ozJjlVPeZSbb0
	zZ2Obb2WMFwBowLkgIU=; b=eAHpwEbpQXllmYFeNxYgwrvlVib8+sOyBj8iy3f+
	7pRmL6JsWnt9cnbbctfsDjuisA6tiILNFeyA+GHtHpcYuB7eF4a+lvtF8ur12CwE
	FWPvBi1DM0g602gaLmitscodJbI0sMxr7h89GhW7q/mK0lqlSe1VK+XJOh71eusH
	WEMlX0grjWHvkgTsJcl+JMxjdqpgGKJlHn/3E0tZkErdayfAM2z1ckKZ5huXXlzs
	QmQdobo9nxwkTcLPyiDtDHTdqkrE2lFqQrVjTLm/je/7Tw5gjgwogOJDcgFvBJc/
	NmJ9tbW3MJm772/0a/DJid78nlvbaL8DycsLiM4RId7TuQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh8w4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1279caef718so13329416c88.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836565; x=1776441365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=Y5Y6T+Gv6oVS02HMFl/R0swvU3Zj2n1aXXYHCJ0DfefXdDpsH/Ro3aRVWz3+Ib4pkd
         ZgHeNns3Dlc2Nv/tPl51KjKsaSBOBwpROol5wDbaj8vVCZ6TZ60CVseZ2H53iGCB5b1u
         Ai+7N4wn3w3rxq3JmEtPw6iDwBIFX9ySmZK8jjNkT+s37f7lTwrdN3eVRXH2XovFe8jU
         VAqCNOVgs/+OVKLzR/avvmFqTRt+lNNzdkltYMdWDQbmMAPfXoPvITGabY9qMVVV51zZ
         2s3Grb9q1osoPoqx8NJDexlZAIzZh31ettPcp/WNgKgklfuJhNKBViyvVhBZTAGgjQuJ
         esHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836565; x=1776441365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=dYzwrz9Z5jmVslgqtYkD1wlyYAfNSuozyVlhACXYZfjgKbRzqAb7KVZTXs4fZu1mDt
         LmKeAEvBkCwL4ykGJEQ78ZzlMQcn75EPsn7JzBxXbHkDLfDIjRWG4k0IWS5b82opBFD5
         3x62ZkU9/wWLIgEzH9bxK4C2WbyEPeD0FiThjAQjuKybGb8ErzqK1hkYpdf+0A7p4eAZ
         RvKp/NHFycCUonFIop7I5RWZKXyXoeN5pijQuQ9FjzR1GVPIuVVi+mNpCNBSusb3ZIBU
         RNpz3QoqhGTjacoUji9EmFZF4C7u55VIdMakPVokJeujvGkQnLSm9h+vsfy39E6x9rpn
         vzsw==
X-Forwarded-Encrypted: i=1; AJvYcCWd2HxYQjtjaWQXdwcUT1BoOs2m9zn3QnZHW4mvnJD0Ve3se7sNSP08wiKzAGC9kOdeODhdxP9j+9k5@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4gQGxdSXlwgghaMx5MZs8n5ig/nV8W4O+MdQFrLYWeg8ZA3k
	Vqnsipnyi6krJYnkvynEXW3ZBhU+g1XNQplFMm6FKGB+kG9i/T5GfW1KhY/kEiBHCF5c6M2Hd7p
	pjxlOXveVhQlRM348Z166eSm75tTmeDNlby4Z3odKl51X0JMMOoq4JS/mC9ZV/Mhj
X-Gm-Gg: AeBDievRN0XByggBASYHvUZPi6A8ZJnoTveQfFCYJy/nK7E9WBCrPTu4AHpZlSjle34
	nyWmyfPa8vv57H6FCv4sKphoxSzkUgJJo2ByFjb7rLFt41v/2w7PgrFLMvPnkfIpgQU2DDNdU99
	wwM99opUWl8OOqVjH4Q5QqQRCAeMuvmMaqB7nYw46R62aDuhhFPISEtdhWD7HoZofLEPvxWwXDO
	xC5SEiW33nTfOH2ZzfgUH+ELFlZQRY3XJZ3at+Vn+7cxKyzJNZAtF6CiFx1KAPfJ25rHM33Vxp9
	EtjJL4JOJVBWvsNpruRiIHcJZXHzA7UnN+3o5A01mwV3HhKGEmWVpm2JMr4xq2iOKjMT3HVd4oq
	ejH7WJA13X6bz0touMHRdTHE9atxudYb9DadGWQuZtXwJ7EskUC5TnsCo9oxEYawkMg+NpuWunB
	U=
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935204c88.14.1775836564631;
        Fri, 10 Apr 2026 08:56:04 -0700 (PDT)
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935173c88.14.1775836563921;
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm4621453eec.21.2026.04.10.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:01 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Message-ID: <adkdkYovFBQytk+n@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfXx7QWpxT78urF
 nox/5Uefif8WLd3LXzoxNOa4g8MZRNKZ0szvMDc8qLrjBKxRdgBtgSem6JJ8L4ybKfHNfYlx2Jd
 lyNJ3+7N8gVhYSFrFkcMNGWL8yBDoLlvimFLcWtemO0GIP2cGV7g1tIjn/p7zzcDQuWutIdBgsC
 Ro8x2gronpe+tNuuTX1YKQ6oSultrVSLo/0rYcp5V5amOHgd5Q6unUAEzIs0GJnWpw6dKn3eMiZ
 gGAgrBFwDfq3c88lNog9PYl1agB9ttVY5wfUFZpembAgr5TA+CwFI3i/Pn280w/qwH+BLPq9xSq
 3CmWd5anAs31aJsbfuOn+h/lWG/f3tMvce4Cjstqs7XvLyu4w3ArnySR2TIg4oAbaQqdpj8b7jj
 +SAMRmvKyBkUwpybsC6UEYnCU7PasQdYXIhZObPA3zBN58r8lxdUnchxfx2HjGLd6yGxgU7OQXz
 xXXjFGxc3Tvc21Cnx1w==
X-Proofpoint-GUID: gJDLDJcWVGkIHFWGveG-wV3dkrYph5iQ
X-Proofpoint-ORIG-GUID: gJDLDJcWVGkIHFWGveG-wV3dkrYph5iQ
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d91d95 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VF2_CLY_OfEEnuuc5wAA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:37PM -0700, Vivek Aknurwar wrote:
> Add device tree bindings for the global clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
>  include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
>  2 files changed, 316 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
