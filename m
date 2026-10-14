Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169F3BBFB2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021621; cv=none; b=k56VqFfoBwDRRwl3w2i/Y7fk0eG0PsGb64oJ77kUBjx1AJCJ4KzKuVJcLsYzqvu75bCnYtxL4pea4jpwG+0Us/+z71tdPBXeVH5jNx2q/EAiSQydNEXxZbHO+ls/44Erx8BbuWAClP1Ls2v07N/qs8dX9T0mEKaguFvdaq82VhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021621; c=relaxed/simple;
	bh=VMNpgjn2vngkCQ2fsUTVUd85vdIjXbEJ1pGkDNawlvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fyuje4+ogYzU1HFHWgF7O3vfJ+W3Kw9Q41zoEVRY0QBq4eRLy6/QGKTY7OCKbmccC6oN/lmdrTl5EL0RZUOCRtMLWFmxtjzfXX7WxE7+zcVIiXYRe9TWoqXF5JLF1Yd4T3ehIKdfKJeJcRGCm9+Dl1te81XBptIvetakjanmgvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aythbRuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPyNz2C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aythbRuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPyNz2C+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMmLCF4167050
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac231trj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so189869385a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021618; x=1792626418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=QPyNz2C+vpp2X5y4WgYi9160MFdusc7BlXlEvd7+RC8PkTjI0FtKn6Tl5zVxCgbFZq
         Z8xzu4pTTSKM4l9E53BqF9pt7w+dhdWZDdXC0dZX5Jq2iUcy/zTCMSWe5law8MVbePdk
         NABsqHYrXRxBHGEdMJWNSoHss4mG6s/Ps630n03dwtllFhwKEn8suy+SLntKi2nPZS34
         XmBMG3SpnOpcsJ6kp/da+u5AEw0jeULhYYTieMnzewzYRra7Yn6n68MwgN/s1JpZYn0q
         KltrxJDpzN3BKV6uV/EeZnbMxi8OZhSXrEvhMQIzN/2O5V5FvfWb+x++zR7VG3mbpR99
         W9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021618; x=1792626418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=QE7uy3nmqvTlPXIn1ZYGWpFY10THqLXer7KrAc7FCgW3knfO3DKazssF9ogPiXu6iT
         upRHyEj/ltLg6a2U8JWCtS/E2iuZ+gRvGje4RBMOxyFHY8kjKXzUFKUONXLNw0M19+Pb
         VKJuvS8w4HvIzgyKhFOPcUJUNcDPZXrfD8kH51jRu9c1Hn+JjzTe4bY1Vq/acmPDI+aD
         OSJepz0MUsU8s9yOkxp7GL3cvDZ0PZCu6qpphPGSptw1Jt0ROrZ0m8rRFEUp/+wPRnUn
         7TgY50haYeBxXqNZeBExwzxRVIsSeulttDCS53MiZ+D9nE7kjRe2u7v2wN5cMR4Lfck+
         QgHg==
X-Forwarded-Encrypted: i=1; AKwUvBwTwiKgVrKE2rxedVnlng9phNPjtY/w3SQ0GZsNd+qjL01god0QTLy9bs6ShUop/A2K15cS5yk2UHTy@vger.kernel.org
X-Gm-Message-State: AFq9FYI0WqRZVpB4nPIppgdIryzld44Bv6DVskMcDCu59ClSeipFDJ2v
	hWYLKozT1kDWELSYPcjoGP9bnSQVS3EkIGHloBW2xMMp0LVt0SWyEnvqw8wAJgEWYrk1rri7REh
	a+38Qu3IMt7HF9e4P7IBj69NUMRiPFw2qQtqa2/hSDRLPaGCH6UQDbIe4BgVe+Lcn
X-Gm-Gg: AYBFou13+q+fC2MFTG0K5DneLeUMjhwjTqN2XIksIh2T2R7v85k+0MrKy6WBLUQwlaD
	bThRbIhdLgfrZH+ARuErY5PL30NPEEorn+ewtWbsPyDZlH4pK0K8OuvQbN4xn6nferer63u098m
	4AhWYUOTYCzcuYbvaxXINjZZ/1KflIdNqU7Dyp2yXyF5H+GQHnwalCEs5qrqdZ6vI2QOmFfNTDZ
	9rUIFQ9DC112lrJe/QNg5KrJjPKelEbT6tvyR9ecjlP10QYDt7uRXv44c1oQxPB8hiMT4900gp0
	H9SZ2PqfJ6bqhR2z0fXptpeNd9xsRdJ+o9dTYnf4yajjzntLL+V7Cc8QOONMEbjHXn1ggUWKXiS
	ctNeLY8mZwbPlml2p8Hc1EdWu+e8tPiroOR5TxTJcHxVdH/9XOn2Z4YdcjSgx51YJW5K5ta+nDT
	UuxUO8m7MRmnuB
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144273985a.5.1792021617531;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX6hOf7DnUZ/uV
 UZev5NFdIxzSqAu/xVZc/qQAvU4oZaFkV9UyvamrDYR4wJ64XSZjYDFkEh1XjVW8iy5CgiH76Fx
 KlYQ1ipDhK6kV2oMrCP0V+Hyw4XUin8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX9cELEtoszA/Z
 /wDQ3AEZQeK6kXJbAAGMyLQ/BzBptx6lF8xI1jurHiL5EtegXHXy/rNUzwPFW5EvOlEDzb5mFUN
 kOtPYOOQcZKl1wCJt0GdMD9aQ5xbNZGf51O9rz5J//clyaDRf2R/78gPbNssbxvHdMbKaWo1umM
 zbWsmeQyGJpQO3TI9iWRoFsPIzQ11g+mkHW+VUaAbZCp0vkIpfLcEEBDV/hS++r6DUUkvHX3ety
 dELL5fW34ttIyj5FnB2mqkSWaL4Sk49opD/NKIZeEVDmRKu0AguAgkFJrnezDuTb0PVtqB7BEPg
 glvfXppKHkFIbrbutEwO/1AAU8mJA0d0pqQo25ijwtr/vsusGAi98QpKjHoD9Hzq1icVOBPFKk9
 RSkmIrjrkj1wajYxH7T6Q1l9p4KSt/xBW1oedGR3ME3LpJlQBwB7PpV2VGqhFWOT18w9NbaqOa3
 E2dd8RuQGSpACzZO/nQ==
X-Proofpoint-GUID: 9PpsmGjhXO5tWuMNuCiB8-d7uKfxHBsK
X-Proofpoint-ORIG-GUID: 9PpsmGjhXO5tWuMNuCiB8-d7uKfxHBsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
