Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463054;
	b=dUqEiLh992mHz/OBJkaF8Tm9L9rXVcgG5UQ/DLJ6BscMq1DxfbIvgqYYPjTpFys4T1d5
	 i7QSJ+4BkVD3s+AT0Do3Tfa9ZshH3HSY/OrRUu/goMkaZ3NOcK8rH3agjy0DT7FntxLq9
	 TRyEg1xayRnOTQmtO6pNfcQKa9rdJ3ZxS0w8NDpugWPKoJskTinF3RpUuU/g5OO0YHxFG
	 KCnIDDsxVvt75Ix2pBdpyCjkKi8tIMj2N5X3h4oLe7ec6YIGstj1sfMaSY3ZhurOB6yaa
	 sm3S7Z5wSSI7xHmAV4W2n5xyu9Ey0zv+3VqO1Rn7UHUcuj76TlWGEMDZXX3pqoeR3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
	b=oyXTvkrbf6On+FCKgy/HdV6zqB+UTVz7pvutXaq/4XRXP08SWmtH9GfTUzUJWZmauFxe
	 OJ7W9Bg5wCfk69oLDAGwb2HW2mHAZcaES6a3X+gum0uRS3kk+SAGbUVoX2yf5h0frFgqO
	 INGJyWyIbhVCNW65eUUecgEIECcZxoPUOUVEov+CpLfvAkgEjEHqOe8bxskdSO1FG3hGW
	 Lq9v11V8vKFspjGucDKJoyNYI4xDdMCnOdcfuDVdJyqbmpNgbnkGKpcW63vzxHd4Abr+R
	 YcC4xSrLEXYiYuQ8uZOMNVWt/Hwn2GWZTu3zXgZgcZ4rbjsVDYm9pxM0R4xbS9gZEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC4606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECC4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1pmD3211982
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmqs384t4urG0xO7kZnecCDg
	SxT8h0KsuOljD4Hr4ko=; b=Yxzx6m9meyKMWzTUoV4ZM00fA/PyHef1MQwgy++0
	RsvNxCLo4tLsnC2untVDjNHHdCQ9VpYwX5wEUV/++y0CugsVH50C62mvbhDkqYtN
	WsObSAYlGtkK8b7emb42vlaMjRZxilMbLZ4afLPRoE51dE8zanhqyuVJnGu20bxR
	tBfO8q37WsXv6bJzgMAAElayDj89NcOUIajq7PWYVdPaXOeMBhaFW54DESkD9qgI
	TR+irxyQpXpqKCFCc0RFn7BepbJAEt/iaiKHZjXzriyAH6D3O0umBbtlDlMsGc8g
	ED3iJAs96p+kHNqiozocaNlcP5qjyjs3iTh+A6kCtoGgiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr5vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:44:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so590045385a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463052; x=1796067852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=gpU5hGY5YSUjFBfP7kSkXwApklIhrQV5j25H00oudZIZt4sz/siIuGUl5gZscQKPzF
         OKfDDrxl3jhG8qKYCQswA/VxqXpE8l1oXUXapJFgmAWcJxRCbP7or6NB8i1H5YWdmuHt
         eQXEb0sqgOC1asT15SwZbhMgbvL+yMAFUSQKT0c/B892ct1eHAIiDwbj9C9233eQMXYE
         rD+s/sI3HQu615IcLTIu+zpNLCK+kF0R9H6liLEc6SQSZhvbowbLYNC+H1RttZnSOHao
         gTY106Z017xyyy8ffQfEski2hFwCATfgX5/LKcTSwT4HZMVNQgAOeUSMsufZQtvpawER
         xpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463052; x=1796067852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=LEZ2X2kAe6dwvoErdOUYwwTVHHo9txv824wk36aI0EhSBgRlILVIzgsGUFGv4ha+nF
         WHihG39BftKEjIiFcxoHh3asqb8Dz6kdav+8/l41xoW/d7ZV2c6ONxBa18ATxpaq2z8X
         SsWe1iBtZiAhVlXqwOoFYdo9FvFUaK7+9w8D3QEoWe+79vbaMJ1C1b0AV7Wh8Qfrp64P
         a0AoGWYT9RbKwkrgX/EWQHSzqjP5Wu/D/3oNkUC/eKpMDBzMP/VU58pZgfjLAWJpuDzX
         CoqdbZNJr2Kq6SksCH0aRv0wUy2MUxkdb9X0s6/KCqmAEWzDs1DrsWRXhVCtW/T4oQzv
         VK7g==
X-Forwarded-Encrypted: i=1; AL+hErELk0rHvu/xa1oAVF2uTCk4jIPNQHhnW7LAFJMHAI2Td94NwQ5pVksamxSxMx1pgbI/h/lR+/5p0zMa@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqE2PEI+1uGJLsdAXMSLP8er6sxHrxU8h/OWlW87EDmN3h8JD
	kuMxLjcSIoZmGizi+vAXUjoW6RlQn0sXvl37dxuECIzjmRfrTS36vExwjKjVzaXhw0E64YPi5/o
	hQBo7aXKlvUWfob47HSBdpUCPlGZdzuepryyAJNzj+8GA98yKe87qX7NW2dhZCopjBk8pC2pZ
X-Gm-Gg: AZFdTZdx987HiYknhDAa9OSlsFG4cHtyOSzcJC0Rc5F3VbHIZWzg7u6y1XUEDoB7Ojd
	pWUx1QpvF7FLCrpJjCxpoamXJw5Ayo04FJmacDusSZEeK5X5zc0YaN56rmIoAz5t3GewRwFck/r
	eIxURebxLJbck/JEWz3+1nZhLzko71t909Z4sYzJRKG/7A5FhzWqdrfTUHcPc+1Iy0k7hbdI1Zv
	cxs1JLErVHLaqQdqL9c13ah4ulIv+CyYIbaexyrNQYmXjis0HjvAw7z2LjjAmqZ3daCmlqlnS3o
	DNUHIn/RH5F3jF4oL8iZvQhNb+YDxG2zuJz6cXg7O6aC88GuuYA4NvR8x8DH0Awf5JK4U95l2K0
	FuEIGvonmvosDjV6wNEoDrYC8vpZvJhV1T935LKS9WCIbyOGC8BhgPnthvPriwRsF
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063645785a.61.1795463051669;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063640385a.61.1795463051048;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27593394f8f.55.2026.11.23.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:44:10 -0800 (PST)
Date: Mon, 23 Nov 2026 21:44:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lafjekmlbln5uccdgrqqrclgoeu7mrsgxbuze4cu7u7zoyrplq@7qdploxt4a7r>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXycio7nrRETtm
 GdROoHzy1mSrWBg8Veh41r+NTZOmqka1UVWP29+oB2elp5XUXeShGqv+lVjPe70YnlQxn3FgI0J
 0Bxpfxh/qVZOEG3MOzgSItoehLo0jCTiZcgVor7M4Wx+IPMTH6duSZs5SjqriyYeGnlOw1fmHnV
 9zmJ+26OwwCoiE76I0td9QsEb0exEVwHMSNxWBNUGNM90ASfuor8Rhi4SdzybyrdWbCMBZozP10
 Xb0beFVfwr3QC89k6IwrsQsnXF1qi/t37rUigfvibrExkMt1FpXIxBI0iV2uLxInMMz9veCrwBE
 xh2rE0QQd4e4k/w3qGIu326B7ZHKdwwankv2kn8VjN3/bv6kK3OzDZCsYPKa6FhvB25JI/M7BHE
 mWLhpJBi6RssK+3f0G9CUMOUoq+Y744BN/DUVLv4WXVv6BHBvyuvUq3/Yb1B/F6Jm3Kv0ZmbL7n
 skT7X43CGbjQVw4xzeA==
X-Proofpoint-GUID: y11gixRMIUBS0U12--o1XSf-_Q9FQs0Z
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04978c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: y11gixRMIUBS0U12--o1XSf-_Q9FQs0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3PDMPBhsLU6A
 SKTkxt/rG/2L+z2pX/x53ogKB/agHV2pcASN1Cv4Yzj/7zheegyMj5d54ldLwqM6aWlOUrNweRJ
 +BgwheM31FHtjkSP6nD7BkHu84T9LcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:51, Bibek Kumar Patro wrote:
> On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
